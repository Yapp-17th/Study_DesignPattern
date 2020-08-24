package com.example.mission2

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.os.Handler
import kotlinx.android.synthetic.main.activity_main.*

class MainActivity : AppCompatActivity(), ViewCallBack {

    lateinit var handler: Handler

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        handler = Handler()
    }

    override fun onStart() {
        super.onStart()

        val menu: Menu = Menu
        val cashier: Cashier = Cashier()
        val orderList: OrderList = OrderList(this, cashier)
        val barista: Barista = Barista(cashier, handler)

        val customer: Customer = Customer(1, cashier)
        customer.order(menu, "아메리카노", barista)
    }

    override fun updateText(str: String) {
        ol.text = str
    }
}