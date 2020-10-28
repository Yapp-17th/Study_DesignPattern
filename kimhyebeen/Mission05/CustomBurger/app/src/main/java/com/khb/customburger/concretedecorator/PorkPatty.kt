package com.khb.customburger.concretedecorator

import com.khb.customburger.Burger
import com.khb.customburger.Decorator

class PorkPatty( // ConcreteDecorator
        private val burger: Burger
): Decorator(burger) {

    override fun taste(): Int {
        return 24 + burger.taste()
    }

    override fun decorate(): ArrayList<String> {
        return burger.decorate().let {
            it.add("고기 패티")
            it
        }
    }
}