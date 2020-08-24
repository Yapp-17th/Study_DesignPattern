package com.khb.coffeesystem

import com.khb.coffeesystem.model.Coffee
import com.khb.coffeesystem.model.MenuItem
import com.khb.coffeesystem.model.OrderSheet
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
        GlobalScope.launch {
            while(Barista.possibleBarista<=0) { delay(200) }

            orderQueue.poll().let { sheet ->
                Barista.makeCoffee(sheet.menu).let { coffee -> notifyToCustomer(sheet.customer, coffee) }
            }
        }
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