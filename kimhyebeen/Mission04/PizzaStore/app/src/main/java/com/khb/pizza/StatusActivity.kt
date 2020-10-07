package com.khb.pizza

import android.annotation.SuppressLint
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.LinearLayout
import com.khb.pizza.factory.PizzaFactory
import com.khb.pizza.model.Menu
import com.khb.pizza.model.User
import com.khb.pizza.pizza.Pizza
import kotlinx.android.synthetic.main.activity_status.*
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.GlobalScope
import kotlinx.coroutines.delay
import kotlinx.coroutines.launch

class StatusActivity : AppCompatActivity() {
    private lateinit var user: User
    private lateinit var menu: Menu
    private lateinit var pizza: Pizza

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_status)

        user = intent.getSerializableExtra("user") as User
        menu = intent.getSerializableExtra("menu") as Menu

        statusPizzaImageView.setImageResource(menu.image)
        statusPizzaNameTextView.text = menu.name

        setUser()
        setViewManager()

        val factory = PizzaFactory()
        factory.orderPizza(menu)
    }

    @SuppressLint("SetTextI18n")
    fun setUser() {
        userNameTextView.text = "이름 : ${user.name}"
        userPhoneTextView.text = "번호 : ${user.number}"
        userAddressTextView.text = "주소 : ${user.address}"
    }

    @SuppressLint("SetTextI18n")
    fun setViewManager() {
        ViewManager.settingView = { pizza ->
            this.pizza = pizza
            GlobalScope.launch(Dispatchers.Main) {
                userLinearLayout.visibility = LinearLayout.VISIBLE
                pizzaLinearLayout.visibility = LinearLayout.VISIBLE

                sizeTextView.text = "사이즈 : ${pizza.size}"
                doughTextView.text = "도우 : ${pizza.dough}"
                cheeseTextView.text = "치즈 : ${pizza.cheese}"
                toppingTextView.text = "토핑 : ${pizza.topping}"
                totalPriceTextView.text = "총 ${pizza.price}원"
            }
        }

        ViewManager.settingStatus = { GlobalScope.launch(Dispatchers.Main) { statusTextView.text = it } }
    }

    companion object {
        fun receivePizza(pizza: Pizza) {
            ViewManager.settingView(pizza)
        }
    }
}