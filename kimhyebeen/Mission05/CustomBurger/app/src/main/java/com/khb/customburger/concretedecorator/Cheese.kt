package com.khb.customburger.concretedecorator

import com.khb.customburger.Burger
import com.khb.customburger.Decorator

class Cheese( // ConcreteDecorator
        private val burger: Burger
): Decorator(burger) {
    override var list: ArrayList<String> = burger.list

    override fun taste(): Int {
        return 10 + burger.taste()
    }

    override fun decorate(): ArrayList<String> {
        list.add("체다 치즈")
        return list
    }
}