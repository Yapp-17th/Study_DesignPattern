package com.example.mission2.base

import com.example.mission2.model.MenuItem
import com.example.mission2.model.OrderData

interface BaseSubject {

    fun registerObserver(o: BaseObserver)
    fun removeObserver(o: BaseObserver)
    fun notifyObservers(orderData: OrderData)
    fun pickMenu(cnum: Int, menuItem: MenuItem)
    fun successMenu(orderData: OrderData)

}