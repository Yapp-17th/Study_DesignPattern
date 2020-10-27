package com.khb.customburger.concretedecorator

import com.khb.customburger.Burger
import com.khb.customburger.Decorator

class ChickenPatty( // ConcreteDecorator
        private val burger: Burger
): Decorator(burger) {
    override var list: ArrayList<String> = burger.list

    override fun taste(): Int {
        return 22 + burger.taste()
    }

    override fun decorate(): ArrayList<String> {
        list.add("치킨 패티")
        return list
    }
}