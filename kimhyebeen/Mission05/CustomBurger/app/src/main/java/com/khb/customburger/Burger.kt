package com.khb.customburger

interface Burger { // Component
    fun taste(): Int
    fun decorate(): ArrayList<String>
}