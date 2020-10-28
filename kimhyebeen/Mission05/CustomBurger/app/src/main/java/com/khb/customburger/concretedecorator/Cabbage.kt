package com.khb.customburger.concretedecorator

import com.khb.customburger.Burger
import com.khb.customburger.Decorator

class Cabbage( // ConcreteDecorator
        private val burger: Burger
): Decorator(burger) {

    override fun taste(): Int {
        return 3 + burger.taste()
    }

    override fun decorate(): ArrayList<String> {
        return burger.decorate().let {
            it.add("양배추")
            it
        }
    }
}