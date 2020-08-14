package com.khb.cafesystem

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.Toast
import androidx.recyclerview.widget.LinearLayoutManager
import com.khb.cafesystem.items.Coffee
import kotlinx.android.synthetic.main.activity_main.*

class MainActivity : AppCompatActivity() {
    private var menuAdapter = MenuAdapter()
    private var menu = Menu
    private var customer = Customer("khb")

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

        orderButton.setOnClickListener {
            getCoffee()
            menuNameEditText.setText("")
        }
    }

    private fun getCoffee() {
        customer.order(menuNameEditText.text.toString())?.let { coffee ->
            customer.giveMoney(coffee.getCost())
            makeToast("${coffee.getCost()}원을 주고 ${coffee.getName()}을 받았습니다")
        } ?: makeToast("그런 메뉴는 없어요")
    }

    private fun makeToast(msg: String) {
        Toast.makeText(this, msg, Toast.LENGTH_SHORT).show();
    }
}