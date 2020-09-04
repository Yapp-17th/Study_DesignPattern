package com.khb.coffeesystem.model

import com.khb.coffeesystem.ShowManager
import com.khb.coffeesystem.items.Coffee
import com.khb.coffeesystem.items.MenuItem
import kotlinx.coroutines.*

class Barista(num: Int) {
    private val number = num

    fun makeCoffee(menuItem: MenuItem): Coffee {
        var coffee: Coffee? = null
        runBlocking {
            ShowManager.addBaristaTextView("바리스타$number : ${menuItem.coffeeName} 만드는 중")

            delay(menuItem.makeTime)
            coffee = Coffee(menuItem.coffeeName, menuItem.price)

            ShowManager.addBaristaTextView("바리스타$number : 다 만들었다!!")
        }
        BaristaManager.addBarista(this)
        return coffee!!
    }
}