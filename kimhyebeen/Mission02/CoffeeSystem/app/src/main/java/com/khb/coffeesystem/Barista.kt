package com.khb.coffeesystem

import com.khb.coffeesystem.model.Coffee
import com.khb.coffeesystem.model.MenuItem

object Barista {

    fun makeCoffee(menuItem: MenuItem): Coffee {
        Thread.sleep(menuItem.makeTime)

        return Coffee(menuItem.coffeeName, menuItem.price)
    }

}