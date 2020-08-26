package com.example.mission2

import com.example.mission2.base.BaseObserver
import com.example.mission2.base.BaseSubject

class Cashier(
    var observers: ArrayList<BaseObserver> = arrayListOf()
    ): BaseSubject {

    lateinit var menuItem: MenuItem
    var index = 0;

    override fun registerObserver(o: BaseObserver) {
        observers.add(o)
    }

    override fun removeObserver(o: BaseObserver) {
        observers.remove(o)
    }

    override fun notifyObservers(orderData: OrderData) {
        observers.forEach {
            it.update(orderData)
        }
    }

    override fun pickMenu(cnum: Int, menuItem: MenuItem){
        index++
        this.menuItem = menuItem
        notifyObservers(OrderData(index, cnum, 0, menuItem))
    }

    override fun successMenu(orderData: OrderData){
        observers.forEach {
            if(it is OrderList){
                it.orderList(orderData)
            }
        }
    }
}