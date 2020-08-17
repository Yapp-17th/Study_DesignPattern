package com.khb.coffeesystem

import com.khb.coffeesystem.model.Coffee
import com.khb.coffeesystem.model.MenuItem
import kotlinx.coroutines.delay
import kotlinx.coroutines.runBlocking

object Barista {
    var possibleBarista = 2

    fun makeCoffee(menuItem: MenuItem): Coffee {
        val coffee: Coffee?
        runBlocking {
            possibleBarista--
            println("바리스타 : ${menuItem.coffeeName}만드는 중..")
            delay(menuItem.makeTime)

            coffee = Coffee(menuItem.coffeeName, menuItem.price)
            possibleBarista++
        }
        return coffee!!
    }
}