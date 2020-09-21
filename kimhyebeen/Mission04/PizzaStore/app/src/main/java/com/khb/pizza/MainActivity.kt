package com.khb.pizza

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.Toast
import com.khb.pizza.adapter.MenuAdapter
import com.khb.pizza.model.Menu
import com.khb.pizza.model.User
import kotlinx.android.synthetic.main.activity_main.*

class MainActivity : AppCompatActivity() {
    private lateinit var user: User
    private var menuAdapter: MenuAdapter = MenuAdapter()
    private var selectedId: Int? = null

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        user = intent.getSerializableExtra("user") as User
        setDataInAdapter()

        pizzaGridView.apply {
            adapter = menuAdapter
            setOnItemClickListener { _, _, position: Int, _ -> selectedItemSetting(position) }
        }

        orderButton.setOnClickListener {
            selectedId?.let {
                Intent(this, StatusActivity::class.java).apply {
                    putExtra("menu", menuAdapter.getItem(it) as Menu)
                    putExtra("user", user)
                    startActivity(this)
                }
                finish()
            } ?: Toast.makeText(this, "메뉴를 선택해주세요", Toast.LENGTH_SHORT).show()
        }
    }

    private fun setDataInAdapter() {
        menuAdapter.apply {
            addItem(Menu(false, R.drawable.pizza_cheese, "치즈 피자", 8000))
            addItem(Menu(false, R.drawable.pizza_pepperoni, "페페로니 피자", 10000))
            addItem(Menu(false, R.drawable.pizza_potato, "포테이토 피자", 12000))
            addItem(Menu(false, R.drawable.pizza_hotchicken, "핫치킨 피자", 18000))
            addItem(Menu(false, R.drawable.pizza_shrimp, "슈림프 피자", 20000))
            addItem(Menu(false, R.drawable.pizza_steak, "스테이크 피자", 24000))
        }
    }

    private fun selectedItemSetting(position: Int) {
        val item = menuAdapter.getItem(position) as Menu
        selectedId =
            if (item.isSelected) {
                null
            } else {
                selectedId?.let { id -> menuAdapter.changeSelected(id) }
                position
            }
        menuAdapter.changeSelected(position)
    }
}