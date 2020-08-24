package com.khb.coffeesystem

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.TextView
import androidx.recyclerview.widget.DividerItemDecoration
import androidx.recyclerview.widget.LinearLayoutManager
import com.khb.coffeesystem.datamodel.CustomerViewItem
import com.khb.coffeesystem.model.Customer
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
            layoutManager = LinearLayoutManager(applicationContext, LinearLayoutManager.VERTICAL, false)
            addItemDecoration(DividerItemDecoration(applicationContext, 1))
        }

        // UI에 구현되는 함수 설정
        setViewFunctions()

        // customer를 만들 때 위 함수를 같이 건네줘요.
        val customer1 = Customer("Liam")
        val customer2 = Customer("Amelia")
        val customer3 = Customer("Harry")
        val customer4 = Customer("Oliver")
        val customer5 = Customer("Adela")
        val customer6 = Customer("James")

        // order
        GlobalScope.launch {
            launch { customer1.order("mocha") }
            launch {
                delay(1200)
                customer2.order("americano")
            }
            launch {
                delay(1700)
                customer3.order("latte")
            }
            launch {
                delay(3000)
                customer4.order("latte")
            }
            launch {
                delay(3500)
                customer5.order("americano")
            }
            launch {
                delay(4000)
                customer6.order("latte")
            }
        }
    }

    fun setViewFunctions() {
        ShowManager.settingCustomerView { item: CustomerViewItem, status: String ->
            if (status == "add") {
                customerAdapter.addItem(item)
            } else if (status == "remove") {
                customerAdapter.removeItem(item)
            }
        }

        ShowManager.settingCounterText { str: String ->
            TextView(this).let {
                it.text = str
                counterTextLinear.addView(it)
            }
        }

        ShowManager.settingBaristaNum { num: Int ->
            baristaTitleText.text = "바리스타 ( 놀고있는 바리스타 $num 명 )"
        }

        ShowManager.settingBaristaText { str: String ->
            TextView(this).let {
                it.text = str
                baristaTextLinear.addView(it)
            }
        }
    }
}