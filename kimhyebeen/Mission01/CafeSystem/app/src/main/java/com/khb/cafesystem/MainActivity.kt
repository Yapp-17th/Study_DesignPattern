package com.khb.cafesystem

import android.graphics.Color
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.TextView
import android.widget.Toast
import androidx.recyclerview.widget.LinearLayoutManager
import kotlinx.android.synthetic.main.activity_main.*

class MainActivity : AppCompatActivity() {
    private var menuAdapter = MenuAdapter()
    private var menu = Menu
    private lateinit var customer: Customer
    private lateinit var addProcessText: (String) -> Unit

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        menuRecyclerView.apply {
            adapter = menuAdapter
            layoutManager = LinearLayoutManager(applicationContext, LinearLayoutManager.VERTICAL, false)
        }

        menu.getAllMenu()?.let { allMenu ->
            allMenu.map { eachMenu ->
                allMenu[eachMenu.key]?.let { menuItem -> menuAdapter.addItem(menuItem) }
            }
        }

        addProcessText = { str ->
            TextView(this).let {
                it.text = str
                it.setTextColor(Color.parseColor("#ffffff"))
                processLinearLayout.addView(it)
            }
        }

        customer = Customer("khb", addProcessText)

        orderButton.setOnClickListener {
            getCoffee()
            menuNameEditText.setText("")
        }
    }

    private fun getCoffee() {
        customer.order(menuNameEditText.text.toString())?.let { coffee ->
            addProcessText("customer : 바리스타로부터 커피를 받았습니다\n")
            customer.giveMoney(coffee.getCost())
        } ?: makeToast("그런 메뉴는 없어요")
    }

    private fun makeToast(msg: String) {
        Toast.makeText(this, msg, Toast.LENGTH_SHORT).show();
    }
}