package com.example.mission5.view

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import androidx.recyclerview.widget.LinearLayoutManager
import com.example.mission5.R
import com.example.mission5.adapter.PizzaAdapter
import com.example.mission5.model.OrderData
import com.example.mission5.model.PizzaMenuItem
import kotlinx.android.synthetic.main.activity_main.*

class MainActivity : AppCompatActivity() {

    val orderData = OrderData

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        val pizzaDatas = arrayListOf(PizzaMenuItem("페퍼로니 피자","pepperonipizza", 14900),
                PizzaMenuItem("포테이토 피자","potatopizza", 15900),
                PizzaMenuItem("고구마 피자","sweetpotatopizza", 16900))
        val pAdapter = PizzaAdapter(this, pizzaDatas)

        pizza.adapter = pAdapter
        pizza.layoutManager = LinearLayoutManager(this)
        pizza.setHasFixedSize(true)

        basket.setOnClickListener {
            val intent = Intent(this, BasketActivity::class.java)
            startActivity(intent)
        }

    }

    override fun onRestart() {
        super.onRestart()
        basket.text = orderData.orderDataSize().toString()
    }
}