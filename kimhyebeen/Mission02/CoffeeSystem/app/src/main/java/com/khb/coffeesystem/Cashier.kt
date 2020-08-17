package com.khb.coffeesystem

import com.khb.coffeesystem.model.Coffee
import com.khb.coffeesystem.model.MenuItem
import kotlin.collections.ArrayList

object Cashier {
    var customerList = ArrayList<Customer>()
    var orderList = ArrayList<MenuItem>()

    fun receiveOrder(customer: Customer, menuItem: MenuItem) {

    }

    fun orderCoffee(name: String, menuItem: MenuItem) {
        Barista.makeCoffee(menuItem).let { coffee -> notifyToCustomer(name, coffee) }
    }

    fun notifyToCustomer(name: String, coffee: Coffee) {
    }
}