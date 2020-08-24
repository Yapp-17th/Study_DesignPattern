package com.khb.coffeesystem

import com.khb.coffeesystem.model.CustomerViewItem

object ShowManager {
    lateinit var customerView: (CustomerViewItem, String) -> Unit
    lateinit var counterText: (String) -> Unit
    lateinit var baristaNum: (Int) -> Unit
    lateinit var baristaText: (String) -> Unit

    fun settingCustomerView( func: (CustomerViewItem, String) -> Unit) {
        customerView = func
    }

    fun settingCounterText( func: (String) -> Unit) {
        counterText = func
    }

    fun settingBaristaNum( func: (Int) -> Unit ) {
        baristaNum = func
    }

    fun settingBaristaText( func: (String) -> Unit) {
        baristaText = func
    }

}