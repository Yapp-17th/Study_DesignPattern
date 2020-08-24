package com.khb.coffeesystem

import com.khb.coffeesystem.model.Coffee
import com.khb.coffeesystem.model.MenuItem
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.delay
import kotlinx.coroutines.launch
import kotlinx.coroutines.runBlocking

object Barista {
    var possibleBarista = 2
    var isWorkBarista1 = false
    var isWorkBarista2 = false

    fun makeCoffee(menuItem: MenuItem): Coffee {
        val coffee: Coffee?
        var baristaNumber = 0
        runBlocking {
            possibleBarista--

            if (!isWorkBarista1) {
                isWorkBarista1 = true
                baristaNumber = 1
            } else {
                isWorkBarista2 = true
                baristaNumber = 2
            }

            launch(Dispatchers.Main) { ShowManager.baristaNum(possibleBarista) }
            delay(100)
            launch(Dispatchers.Main) { ShowManager.baristaText("바리스타 ${baristaNumber} : ${menuItem.coffeeName}만드는 중..") }
            delay(menuItem.makeTime)

            coffee = Coffee(menuItem.coffeeName, menuItem.price)
            launch(Dispatchers.Main) { ShowManager.baristaNum(possibleBarista) }
            launch(Dispatchers.Main) { ShowManager.baristaText("바리스타 ${baristaNumber} : 다 만들었다!!") }

            if (baristaNumber == 1) isWorkBarista1 = false
            else isWorkBarista2 = false

            possibleBarista++
        }
        return coffee!!
    }
}