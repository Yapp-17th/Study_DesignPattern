package com.khb.coffeesystem.model

import com.khb.coffeesystem.ShowManager
import com.khb.coffeesystem.items.Coffee
import com.khb.coffeesystem.items.MenuItem
import com.khb.coffeesystem.items.OrderSheet
import kotlinx.coroutines.*
import java.util.*
import kotlin.collections.ArrayList

object Cashier {
    private var customerList = ArrayList<Customer>()
    private var orderQueue: Queue<OrderSheet> = LinkedList<OrderSheet>()

    fun receiveOrder(customer: Customer, menuItem: MenuItem) {
        customerList.add(customer)
        orderQueue.add(OrderSheet(customer, menuItem))

        ShowManager.addCashierTextView("${menuItem.coffeeName}을 주문 받았습니다.")
        orderCoffee()
    }

    private fun orderCoffee() {
        // BaristaManager에게 커피만들게 하기
        if(orderQueue.size == 0) return

        if (BaristaManager.isAvailable()) {
            GlobalScope.launch {
                orderQueue.poll()?.let { sheet ->
                    BaristaManager.giveWorkToBarista(sheet.menu).let { coffee ->
                        notifyToCustomer(sheet.customer, coffee)
                    }
                }
            }
        }
    }

    fun update() {
        orderCoffee()
    }

    private fun notifyToCustomer(customer: Customer, coffee: Coffee) {
        ShowManager.addCashierTextView("<알림> ${customer.name} 손님 주문하신 ${coffee.name} 나왔습니다!!")
        customerList.map { eachCustomer ->
            eachCustomer.update(customer.name, coffee)
        }
        customerList.remove(customer)
    }
}