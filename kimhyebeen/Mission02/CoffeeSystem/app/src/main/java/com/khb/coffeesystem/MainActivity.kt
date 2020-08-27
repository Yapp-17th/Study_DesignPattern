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

        // RecyclerView에 customer들을 추가/삭제하는 함수 생성
        customerRecyclerView.apply {
            adapter = customerAdapter
            layoutManager = LinearLayoutManager(applicationContext, LinearLayoutManager.VERTICAL, false)
            addItemDecoration(DividerItemDecoration(applicationContext, 1))
        }

        // UI에 구현되는 함수 설정
        setShowManager()

        // order
        GlobalScope.launch {
            launch {
                Customer("Liam").order("mocha")
            }
            launch {
                delay(200)
                Customer("Amelia").order("americano")
            }
            launch {
                delay(1000)
                Customer("Harry").order("latte")
            }
            launch {
                delay(1500)
                Customer("Oliver").order("latte")
            }
            launch {
                delay(2000)
                Customer("Adela").order("americano")
            }
        }
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