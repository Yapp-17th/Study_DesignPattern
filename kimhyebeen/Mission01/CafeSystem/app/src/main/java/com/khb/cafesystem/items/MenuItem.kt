package com.khb.cafesystem.items

class MenuItem(name: String, price: Int) {
    private var name: String = name
    private var price: Int = price

    fun getMenuName(): String {
        return this.name
    }
    fun getCost(): Int {
        return this.price
    }
}