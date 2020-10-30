package com.khb.customburger.concretedecorator

import com.khb.customburger.Burger
import com.khb.customburger.Decorator

class ChickenPatty( // ConcreteDecorator
        private val burger: Burger
): Decorator(burger) {

    override fun taste(): Int {
        return 22 + burger.taste()
    }

    override fun decorate(): ArrayList<String> {
        return burger.decorate().let {
            it.add("치킨 패티")
            it
        }
    }
}