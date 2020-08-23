package com.khb.coffeesystem

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import androidx.recyclerview.widget.LinearLayoutManager
import com.khb.coffeesystem.model.CustomerViewItem
import kotlinx.android.synthetic.main.activity_main.*
import kotlinx.coroutines.GlobalScope
import kotlinx.coroutines.delay
import kotlinx.coroutines.launch

class MainActivity : AppCompatActivity() {
    var customerAdapter = CustomerAdapter()

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        // RecyclerView에 customer들을 추가/삭제하는 함수 생성
        customerRecyclerView.apply {
            adapter = customerAdapter
            layoutManager = LinearLayoutManager(applicationContext, LinearLayoutManager.HORIZONTAL, false)
        }

        var setCustomerView = { item: CustomerViewItem, status: String ->
            if (status == "add") {
                customerAdapter.addItem(item)
            } else if (status == "remove") {
                customerAdapter.removeItem(item)
            }
        }

        // customer를 만들 때 위 함수를 같이 건네줘요.
        val customer1 = Customer("Tommy", setCustomerView)
        val customer2 = Customer("Anna", setCustomerView)
        val customer3 = Customer("Harry", setCustomerView)

        // order
        GlobalScope.launch {
            launch { customer1.order("mocha") }
            launch {
                delay(500)
                customer2.order("americano")
            }
            launch {
                delay(1000)
                customer3.order("americano")
            }
        }
    }
}