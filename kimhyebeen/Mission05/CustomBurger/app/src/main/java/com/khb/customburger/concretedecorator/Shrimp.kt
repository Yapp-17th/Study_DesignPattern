package com.khb.customburger.concretedecorator

import com.khb.customburger.Burger
import com.khb.customburger.Decorator

class Shrimp( // ConcreteDecorator
        private val burger: Burger
): Decorator(burger) {
    override var list: ArrayList<String> = burger.list

    override fun taste(): Int {
        return 12 + burger.taste()
    }

    override fun decorate(): ArrayList<String> {
        list.add("새우")
        return list
    }
}