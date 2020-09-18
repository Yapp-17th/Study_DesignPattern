package com.khb.pizza.items

abstract class Pizza(
    extra: Int,
    extraTopping: List<String>?
) {
    abstract var cheese: ArrayList<String>
    abstract var price: Int
    abstract var dough: String
    abstract var topping: ArrayList<String>
    abstract var size: Char

    init {
        extraTopping?.map { this.topping.add(it) }
        this.price += extra
    }

    fun changeDough(dough: String) {
        this.dough = dough
    }

    fun upgradeSize() {
        this.size = 'L'
        this.price += 4000
    }
}