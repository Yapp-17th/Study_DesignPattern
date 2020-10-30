package com.example.mission5.view

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import com.example.mission5.PizzaOrderFactory
import com.example.mission5.R
import com.example.mission5.model.OrderData
import com.example.mission5.model.PizzaMenuItem
import kotlinx.android.synthetic.main.activity_order.*

class OrderActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_order)

        var pizzaOrderFactory = PizzaOrderFactory()

        val orderData = OrderData

        val intent = getIntent()
        val pizza = intent.getSerializableExtra("pizza") as PizzaMenuItem

        var price = pizza.price

        val resId = resources.getIdentifier(pizza.name, "drawable","com.example.mission5")
        order_img.setImageResource(resId)
        order_name.text = pizza.type
        order_price.text = pizza.price.toString()

        add.setOnClickListener {
            var size = "small"
            var toppingName = ""
            var toppingPrice = 0
            when(radiogroup.checkedRadioButtonId){
                R.id.radioButton -> size = "small"
                R.id.radioButton2 -> {  size = "medium"
                                        price += 1000 }
                R.id.radioButton3 -> {  size = "large"
                                        price += 2000 }
            }
            when(t.checkedRadioButtonId){
                R.id.t1 -> {
                    toppingName = "치즈토핑"
                    toppingPrice = 2000
                    price += 2000
                }
                R.id.t2 -> {
                    toppingName = "치즈크러스트"
                    toppingPrice = 3000
                    price += 3000
                }
                R.id.t3 -> {
                    toppingName = "오븐스파게티"
                    toppingPrice = 5000
                    price += 5000
                }
            }

            val orderPizza = pizzaOrderFactory.createPizzaOrder(pizza.name, size, price, toppingName, toppingPrice)
            orderData.addOrder(orderPizza)
            finish()
        }
    }
}