package com.khb.customburger

class Cabbage( // ConcreteDecorator
        private val burger: Burger
): Decorator(burger) {
    override var list: ArrayList<String> = burger.list

    override fun taste(): Int {
        return 3 + burger.taste()
    }

    override fun decorate(): ArrayList<String> {
        list.add("양배추")
        return list
    }
}