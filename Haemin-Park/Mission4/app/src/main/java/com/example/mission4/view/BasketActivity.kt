package com.example.mission4.view

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.view.View
import androidx.recyclerview.widget.LinearLayoutManager
import com.example.mission4.R
import com.example.mission4.adapter.OrderAdapter
import com.example.mission4.adapter.PizzaAdapter
import com.example.mission4.model.OrderData
import com.example.mission4.model.PizzaMenuItem
import kotlinx.android.synthetic.main.activity_basket.*
import kotlinx.android.synthetic.main.activity_main.*

class BasketActivity : AppCompatActivity() {

    val orderData = OrderData

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_basket)

        val oAdapter = OrderAdapter(this, orderData.orderDataList())

        order.adapter = oAdapter
        order.layoutManager = LinearLayoutManager(this)
        order.setHasFixedSize(true)

    }
}