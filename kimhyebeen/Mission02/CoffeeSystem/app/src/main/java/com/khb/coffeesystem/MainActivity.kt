package com.khb.coffeesystem

import android.annotation.SuppressLint
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.TextView
import androidx.recyclerview.widget.DividerItemDecoration
import androidx.recyclerview.widget.LinearLayoutManager
import com.khb.coffeesystem.items.CustomerViewItem
import com.khb.coffeesystem.model.Customer
import kotlinx.android.synthetic.main.activity_main.*
import kotlinx.coroutines.*

class MainActivity : AppCompatActivity() {
    private var customerAdapter = CustomerAdapter()

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        setRecyclerView()

        setShowManager()

        GlobalScope.launch {
            customerOrder(300, "Liam", "mocha")
            customerOrder(500, "Amelia", "americano")
            customerOrder(1500, "Harry", "latte")
            customerOrder(2500, "Oliver", "latte")
            customerOrder(2700, "Adela", "americano")
        }
    }

    private fun setRecyclerView() {
        customerRecyclerView.apply {
            adapter = customerAdapter
            layoutManager = LinearLayoutManager(applicationContext, LinearLayoutManager.VERTICAL, false)
            addItemDecoration(DividerItemDecoration(applicationContext, 1))
        }
    }

    private suspend fun customerOrder(time: Long, name: String, coffee: String) {
        delay(time)
        Customer(name).order(coffee)
    }

    @SuppressLint("SetTextI18n")
    private fun setShowManager() {
        ShowManager.settingCustomerView { item: CustomerViewItem, status: String ->
            if (status == "add") {
                customerAdapter.addItem(item)
            } else if (status == "complete") {
                customerAdapter.changeColor(item)
            }
        }

        ShowManager.settingCounterText { str: String ->
            TextView(this).let {
                it.text = str
                counterTextLinear.addView(it)
            }
        }

        ShowManager.settingBaristaNum { num: Int ->
            baristaTitleText.text = "바리스타 (놀고있는 바리스타 $num 명)"
        }

        ShowManager.settingBaristaText { str: String ->
            TextView(this).let {
                it.text = str
                baristaTextLinear.addView(it)
            }
        }
    }
}