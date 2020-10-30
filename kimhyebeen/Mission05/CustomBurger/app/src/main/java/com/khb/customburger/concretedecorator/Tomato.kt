package com.khb.customburger.concretedecorator

import com.khb.customburger.Burger
import com.khb.customburger.Decorator

class Tomato( // ConcreteDecorator
        private val burger: Burger
): Decorator(burger) {

    override fun taste(): Int {
        return 5 + burger.taste()
    }

    override fun decorate(): ArrayList<String> {
        return burger.decorate().let {
            it.add("토마토")
            it
        }
    }
}