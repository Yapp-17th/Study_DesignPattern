package com.khb.coffeesystem.model

import com.khb.coffeesystem.ShowManager
import com.khb.coffeesystem.items.Coffee
import com.khb.coffeesystem.items.MenuItem
import com.khb.coffeesystem.items.OrderSheet
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.GlobalScope
import kotlinx.coroutines.launch
import java.util.*
// subject
object BaristaManager {
    private var baristaQueue: Queue<Barista> = LinkedList<Barista>()

    init {
        baristaQueue.add(Barista(1))
        baristaQueue.add(Barista(2))
    }

    fun giveWorkToBarista(menuItem: MenuItem): Coffee {
        var coffee: Coffee? = null
        baristaQueue.poll()?.let { barista ->
            ShowManager.changeBaristaCount(baristaQueue.size)
            coffee = barista.makeCoffee(menuItem)
        }
        return coffee!!
    }

    fun isAvailable(): Boolean {
        return baristaQueue.size > 0
    }

    fun addBarista(barista: Barista) {
        this.baristaQueue.add(barista)
        ShowManager.changeBaristaCount(baristaQueue.size)
        Cashier.update()
    }
}