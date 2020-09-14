package com.khb.pizza.items

abstract class Pizza {
    abstract var cheese: String
    abstract var price: Int
    abstract var dough: String
    abstract var topping: ArrayList<String>
    abstract var size: Char

    fun addTopping(vararg item: String) {
        item.map { this.topping.add(it) }
    }
    fun addPrice(extra: Int) {
        this.price += extra
    }
}