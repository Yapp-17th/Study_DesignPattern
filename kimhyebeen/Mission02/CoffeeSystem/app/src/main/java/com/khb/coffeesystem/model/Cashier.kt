package com.khb.coffeesystem.model

import com.khb.coffeesystem.ShowManager
import com.khb.coffeesystem.datamodel.Coffee
import com.khb.coffeesystem.datamodel.MenuItem
import com.khb.coffeesystem.datamodel.OrderSheet
import kotlinx.coroutines.*
import java.util.*
import kotlin.collections.ArrayList

object Cashier {
    private var customerList = ArrayList<Customer>()
    private var orderQueue: Queue<OrderSheet> = LinkedList<OrderSheet>()

    fun receiveOrder(customer: Customer, menuItem: MenuItem) {
        customerList.add(customer)
        GlobalScope.launch(Dispatchers.Main) { ShowManager.counterText("${menuItem.coffeeName}을 주문 받았습니다.") }
        orderQueue.add(OrderSheet(customer, menuItem))
        orderCoffee()
    }

    fun orderCoffee() {
        // BaristaManager에게 커피만들게 하기

    }

    fun update() {
        orderCoffee()
    }

    fun notifyToCustomer(customer: Customer, coffee: Coffee) {
        runBlocking {
            println("cashier: ${customer.name} 손님 주문하신 ${coffee.name} 나왔습니다~!!")
            launch(Dispatchers.Main) { ShowManager.counterText("<알림> ${customer.name} 손님 주문하신 ${coffee.name} 나왔습니다!!") }
            delay(300)

            customerList.map { eachCustomer -> eachCustomer.receiveAlarm(customer.name, coffee) }
            customerList.remove(customer)
        }
    }
}