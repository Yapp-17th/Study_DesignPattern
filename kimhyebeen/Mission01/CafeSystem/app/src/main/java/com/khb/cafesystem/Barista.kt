package com.khb.cafesystem

import com.khb.cafesystem.items.Coffee
import com.khb.cafesystem.items.MenuItem

object Barista {
    private var cash = 0;

    fun makeCoffee(menuItem: MenuItem): Coffee {
        return Coffee(menuItem)
    }

    fun recieveMoney(money: Int) {
        cash += money
    }
}