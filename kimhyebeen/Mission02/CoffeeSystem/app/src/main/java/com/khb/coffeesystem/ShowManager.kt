package com.khb.coffeesystem

import com.khb.coffeesystem.model.CustomerViewItem

object ShowManager {
    lateinit var setCustomerView: (CustomerViewItem, String) -> Unit

    fun setFunc( func: (CustomerViewItem, String) -> Unit) {
        setCustomerView = func
    }
}