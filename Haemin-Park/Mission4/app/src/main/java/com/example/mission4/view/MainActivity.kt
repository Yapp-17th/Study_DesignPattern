package com.example.mission4.view

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import androidx.recyclerview.widget.LinearLayoutManager
import com.example.mission4.R
import com.example.mission4.adapter.PizzaAdapter
import com.example.mission4.model.OrderData
import com.example.mission4.model.PizzaMenuItem
import kotlinx.android.synthetic.main.activity_main.*

class MainActivity : AppCompatActivity() {

    val orderData = OrderData

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        val pizzaDatas = arrayListOf<PizzaMenuItem>(PizzaMenuItem("페퍼로니 피자", 14900, "p1"),
                PizzaMenuItem("포테이토 피자", 15900, "p2"), PizzaMenuItem("고구마 피자", 16900, "p3"))
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
        basket.text = orderData.orderSize().toString()
    }
}