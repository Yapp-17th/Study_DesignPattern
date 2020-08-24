package com.khb.coffeesystem.model

import com.khb.coffeesystem.R
import com.khb.coffeesystem.ShowManager
import com.khb.coffeesystem.datamodel.Coffee
import com.khb.coffeesystem.datamodel.CustomerViewItem
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.GlobalScope
import kotlinx.coroutines.launch

class Customer(
    name: String
) {
    val name = name
    val imageList = arrayOf(
        R.drawable.customer1,
        R.drawable.customer2,
        R.drawable.customer3,
        R.drawable.customer4,
        R.drawable.customer5,
        R.drawable.customer6
    )
    lateinit var customerItem: CustomerViewItem

    fun order(
        coffeeName: String
    ) {
        // RecyclerView에서 index를 검색하기 위한 CustomerViewItem 객체 저장
        customerItem =  CustomerViewItem(name, imageList[(Math.random() * 5).toInt()], coffeeName, "")

        GlobalScope.launch(Dispatchers.Main) { ShowManager.customerView(customerItem, "add") }

        Menu.choose(coffeeName)?.let { menu -> Cashier.receiveOrder(this, menu) }
    }

    fun receiveAlarm(
        name: String,
        coffee: Coffee
    ) {
        if (this.name != name) {
            println("customer(${this.name}): 내 껀 언제나와ㅠ")
        }
        else {
            println("customer(${this.name}): 내꺼다!!")
            GlobalScope.launch(Dispatchers.Main) {
                ShowManager.customerView(
                    customerItem,
                    "remove"
                )
            }
        }
    }
}