package com.example.mission2.base

import com.example.mission2.MenuItem
import com.example.mission2.OrderData

interface BaseSubject {

    fun registerObserver(o: BaseObserver)
    fun removeObserver(o: BaseObserver)
    fun notifyObservers(orderData: OrderData)
    fun pickMenu(cnum: Int, menuItem: MenuItem)
    fun successMenu(orderData: OrderData)

}