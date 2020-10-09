package com.example.mission4.view

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import com.example.mission4.PizzaFactory
import com.example.mission4.R
import com.example.mission4.model.OrderData
import com.example.mission4.model.PizzaMenuItem
import kotlinx.android.synthetic.main.activity_order.*
import kotlin.properties.Delegates

class OrderActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_order)

        var pizzaFactory = PizzaFactory()

        val orderData = OrderData

        val intent = getIntent()
        val pizza = intent.getSerializableExtra("pizza") as PizzaMenuItem

        var price = pizza.price

        val resId = resources.getIdentifier(pizza.pid, "drawable","com.example.mission4")
        order_img.setImageResource(resId)
        order_name.text = pizza.name
        order_price.text = pizza.price.toString()

        add.setOnClickListener {
            var size = "small"
            var topping = ArrayList<String>()
            when(radiogroup.checkedRadioButtonId){
                R.id.radioButton -> size = "small"
                R.id.radioButton2 -> {  size = "medium"
                                        price+=1000 }
                R.id.radioButton3 -> {  size = "large"
                                        price+=2000 }
            }
            if(checkBox.isChecked){ topping.add("치즈토핑 추가(+2000)")
                price+=2000}
            if(checkBox2.isChecked){ topping.add("치즈크러스트 추가(+3000)")
                price+=3000}
            if(checkBox3.isChecked){ topping.add("오븐 스파게티 추가(+5000)")
                price+=5000}

            val orderPizza = pizzaFactory.createPizza(pizza.name, size,price, topping)
            orderData.addOrder(orderPizza)
            finish()
        }
    }
}