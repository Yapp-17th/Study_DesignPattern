package com.khb.coffeesystem

import com.khb.coffeesystem.items.CustomerViewItem
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.GlobalScope
import kotlinx.coroutines.launch

object ShowManager {
    private lateinit var customerView: (CustomerViewItem, String) -> Unit
    private lateinit var counterText: (String) -> Unit
    private lateinit var baristaNum: (Int) -> Unit
    private lateinit var baristaText: (String) -> Unit

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

    fun addCustomerView(item: CustomerViewItem) {
        GlobalScope.launch(Dispatchers.Main) { customerView(item, "add") }
    }

    fun finishCustomerView(item: CustomerViewItem) {
        GlobalScope.launch(Dispatchers.Main) { customerView(item, "complete") }
    }

    fun addCashierTextView(text: String) {
        GlobalScope.launch(Dispatchers.Main) { counterText(text) }
    }

    fun changeBaristaCount(cnt: Int) {
        GlobalScope.launch(Dispatchers.Main) { baristaNum(cnt) }
    }

    fun addBaristaTextView(text: String) {
        GlobalScope.launch(Dispatchers.Main) { baristaText(text) }
    }

}