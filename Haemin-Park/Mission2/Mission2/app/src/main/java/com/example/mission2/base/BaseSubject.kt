package com.example.mission2.base

import com.example.mission2.MenuItem

interface BaseSubject {

    fun registerObserver(o: BaseObserver)
    fun removeObserver(o: BaseObserver)
    fun notifyObservers()
    fun pickMenu(menuItem: MenuItem)
    fun successMenu()

}