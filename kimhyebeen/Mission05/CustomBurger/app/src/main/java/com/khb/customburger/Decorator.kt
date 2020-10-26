package com.khb.customburger

abstract class Decorator(
        private val burger: Burger
): Burger {
    override fun decorate(): ArrayList<String> {
        return burger.decorate()
    }
}