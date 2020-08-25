package com.khb.coffeesystem.model

import com.khb.coffeesystem.ShowManager
import com.khb.coffeesystem.items.Coffee
import com.khb.coffeesystem.items.MenuItem
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.delay
import kotlinx.coroutines.launch
import kotlinx.coroutines.runBlocking

class Barista(num: Int) {
    private val number = num

    fun makeCoffee(menuItem: MenuItem): Coffee {
        val coffee: Coffee?
        runBlocking {
            launch(Dispatchers.Main) { ShowManager.baristaText("바리스타$number : ${menuItem.coffeeName} 만드는 중") }

            delay(menuItem.makeTime)
            coffee = Coffee(menuItem.coffeeName, menuItem.price)

            launch(Dispatchers.Main) { ShowManager.baristaText("바리스타$number : 다 만들었다!!") }
        }
        BaristaManager.addBarista(this)
        return coffee!!
    }
}