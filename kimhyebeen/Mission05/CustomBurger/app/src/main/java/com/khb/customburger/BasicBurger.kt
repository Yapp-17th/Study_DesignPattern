package com.khb.customburger

class BasicBurger: Burger { // ConcreteComponent
    override var list: ArrayList<String> = ArrayList()

    override fun taste(): Int {
        return 5
    }

    override fun decorate(): ArrayList<String> {
        list.add("햄버거 빵")
        return list
    }
}