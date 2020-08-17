package com.khb.coffeesystem

import com.khb.coffeesystem.model.Coffee
import com.khb.coffeesystem.model.MenuItem
import com.khb.coffeesystem.model.OrderSheet
import kotlinx.coroutines.GlobalScope
import kotlinx.coroutines.delay
import kotlinx.coroutines.launch
import kotlinx.coroutines.runBlocking
import java.util.*
import kotlin.collections.ArrayList

object Cashier {
    private var customerList = ArrayList<Customer>()
    private var orderList: Queue<OrderSheet> = LinkedList<OrderSheet>()

    fun receiveOrder(customer: Customer, menuItem: MenuItem) {
        GlobalScope.launch {
            delay(1000)

            customerList.add(customer)
            orderList.add(OrderSheet(customer, menuItem))
            orderCoffee()
        }
    }

    fun orderCoffee() {
        GlobalScope.launch {
            while(Barista.possibleBarista<=0) { delay(200) }

            orderList.poll().let { sheet ->
                Barista.makeCoffee(sheet.menu).let { coffee -> notifyToCustomer(sheet.customer, coffee) }
            }
        }
    }

    fun notifyToCustomer(customer: Customer, coffee: Coffee) {
        runBlocking {
            delay(500)
            println("cashier: ${customer.name} 손님 주문하신 ${coffee.name} 나왔습니다~!!")
            delay(500)

            customerList.map { eachCustomer -> eachCustomer.receiveAlarm(customer.name, coffee) }
            customerList.remove(customer)
        }
    }
}