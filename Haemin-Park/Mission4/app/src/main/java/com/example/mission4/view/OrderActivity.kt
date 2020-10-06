package com.example.mission4.view

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import com.example.mission4.R
import com.example.mission4.model.OrderData
import com.example.mission4.model.PizzaMenuItem
import kotlinx.android.synthetic.main.activity_order.*

class OrderActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_order)

        val orderData = OrderData

        val intent = getIntent()
        val pizza = intent.getSerializableExtra("pizza") as PizzaMenuItem

        val resId = resources.getIdentifier("p"+pizza.price.toString(), "drawable","com.example.mission4")
        order_img.setImageResource(resId)
        order_name.text = pizza.name
        order_price.text = pizza.price.toString()

        add.setOnClickListener {
            //orderData.addOrder(피자객체)
            finish()
        }
    }
}