package com.khb.cafesystem

import com.khb.cafesystem.items.Coffee

class Customer(customerName: String) {
    private var customerName = customerName
    private val menu = Menu
    private val barista = Barista

    fun order(menuName: String): Coffee? {
        menu.choose(menuName)?.let {
            return barista.makeCoffee(it)
        } ?: return null
    }

    fun giveMoney(money: Int) {
        barista.recieveMoney(money);
    }
}