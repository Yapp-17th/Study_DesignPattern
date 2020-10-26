package com.khb.customburger

interface Burger { // Component
    var list: ArrayList<String>
    fun taste(): Int
    fun decorate(): ArrayList<String>
}