package com.khb.customburger

class BasicBurger: Burger { // ConcreteComponent
    override fun taste(): Int {
        return 5
    }

    override fun decorate(): ArrayList<String> {
        return arrayListOf("햄버거 빵")
    }
}