package com.example.mission2

import com.example.mission2.base.BaseObserver
import com.example.mission2.base.BaseSubject

class Cashier(
    var observers: ArrayList<BaseObserver> = arrayListOf(),
    var menuName: String = "default"
    ): BaseSubject {

    override fun registerObserver(o: BaseObserver) {
        observers.add(o)
    }

    override fun removeObserver(o: BaseObserver) {
        observers.remove(o)
    }

    override fun notifyObservers() {
        observers.forEach {
            it.update(menuName)
        }
    }

    override fun pickMenu(menuItem: MenuItem){
        this.menuName = menuItem.getName()
        notifyObservers()
    }

    override fun successMenu(){
        observers.forEach {
            if(it is OrderList){
                it.orderList()
            }
        }
    }
}