package com.khb.coffeesystem.model

import com.khb.coffeesystem.ShowManager
import com.khb.coffeesystem.datamodel.Coffee
import com.khb.coffeesystem.datamodel.MenuItem
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.delay
import kotlinx.coroutines.launch
import kotlinx.coroutines.runBlocking

class Barista(num: Int) {
    private val number = num
    private var isWorking = false

    fun setWorkState(check: Boolean) {
        this.isWorking = check
    }

    fun makeCoffee(menuItem: MenuItem): Coffee {
        val coffee: Coffee?
        runBlocking {
            delay(menuItem.makeTime)
            coffee = Coffee(menuItem.coffeeName, menuItem.price)
        }
        return coffee!!
    }
}