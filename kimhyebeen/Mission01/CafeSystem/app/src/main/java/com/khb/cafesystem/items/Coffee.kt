package com.khb.cafesystem.items

class Coffee(menuItem: MenuItem) {
    private var name: String = menuItem.getMenuName()
    private var price: Int = menuItem.getCost()

    fun getName(): String {
        return this.name
    }

    fun getCost(): Int {
        return this.price
    }
}