package com.khb.coffeesystem.model

import com.khb.coffeesystem.R
import com.khb.coffeesystem.ShowManager
import com.khb.coffeesystem.items.Coffee
import com.khb.coffeesystem.items.CustomerViewItem
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.GlobalScope
import kotlinx.coroutines.launch

class Customer( val name: String ) {
    private var coffee: Coffee? = null
    private val imageList = arrayOf(
        R.drawable.customer1,
        R.drawable.customer2,
        R.drawable.customer3,
        R.drawable.customer4,
        R.drawable.customer5,
        R.drawable.customer6
    )
    private lateinit var customerItem: CustomerViewItem

    fun order(coffeeName: String) {
        // RecyclerView에 CustomerViewItem 객체 추가
        customerItem =  CustomerViewItem(
            name,
            imageList[(Math.random() * 6).toInt()],
            coffeeName,
            false
        )

        ShowManager.addCustomerView(customerItem)
        Menu.choose(coffeeName)?.let { menu -> Cashier.receiveOrder(this, menu) }
    }

    fun update(name: String, coffee: Coffee) {
        if (this.name != name) return

        this.coffee = coffee
        ShowManager.finishCustomerView(customerItem)
    }
}