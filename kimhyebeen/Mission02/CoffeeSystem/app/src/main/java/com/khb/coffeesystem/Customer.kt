package com.khb.coffeesystem

import com.khb.coffeesystem.model.Coffee
import com.khb.coffeesystem.model.CustomerViewItem
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.GlobalScope
import kotlinx.coroutines.launch

class Customer(
    name: String,
    customerView: (CustomerViewItem, String) -> Unit
) {
    val name = name
    val setCustomerView = customerView
    val imageList = arrayOf(R.drawable.customer1, R.drawable.customer2, R.drawable.customer3, R.drawable.customer4, R.drawable.customer5, R.drawable.customer6)
    lateinit var customerItem: CustomerViewItem

    fun order(
        coffeeName: String
    ) {
        println("customer($name): $coffeeName 을 주문했습니다.")
        customerItem =  CustomerViewItem(name, imageList[(Math.random() * 5).toInt()], coffeeName)

        GlobalScope.launch(Dispatchers.Main) {
            setCustomerView(customerItem, "add")
        }

        Menu.choose(coffeeName)?.let { menu -> Cashier.receiveOrder(this, menu) }
    }

    fun receiveAlarm(
        name: String,
        coffee: Coffee
    ) {
        if (this.name != name) println("customer(${this.name}): 내 껀 언제나와ㅠ")
        else {
            println("customer(${this.name}): 내꺼다!!")

            GlobalScope.launch(Dispatchers.Main) {
                setCustomerView(customerItem, "remove")
            }
        }
    }
}