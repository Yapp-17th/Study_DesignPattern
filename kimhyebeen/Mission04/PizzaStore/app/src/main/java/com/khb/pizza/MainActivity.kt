package com.khb.pizza

import android.graphics.Color
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.view.View
import android.widget.AdapterView
import android.widget.Toast
import com.khb.pizza.adapter.MenuAdapter
import com.khb.pizza.model.Menu
import kotlinx.android.synthetic.main.activity_main.*
import kotlinx.android.synthetic.main.item_menu.view.*

class MainActivity : AppCompatActivity() {
    private lateinit var user: User
    private var menuAdapter: MenuAdapter = MenuAdapter()
    private var selectedItemView: View? = null
    private var selectedId: Int = -1
    private var selectedMenu: Menu? = null

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        user = intent.getSerializableExtra("user") as User

        setDataInAdapter()

        pizzaGridView.apply {
            adapter = menuAdapter
            setOnItemClickListener { _, view: View, position: Int, _ -> selectedItemSetting(view, position) }
        }

        preButton.setOnClickListener { finish() }
        orderButton.setOnClickListener {
            selectedMenu?.let { toast("메뉴가 선택되었습니다.") } ?: toast("메뉴를 선택해주세요")
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

    private fun selectedItemSetting(view: View, position: Int) {
        val item = menuAdapter.getItem(position) as Menu
        if (item.isSelected) {
            setColor(view, "#ffffff")
            selectedMenu = null
        } else {
            setColor(view, "#ffc107")
            selectedMenu?.let { resetOtherSelectedItem() }
            selectedMenu = item
            selectedId = position
            selectedItemView = view
        }
        menuAdapter.changeSelected(position)
    }

    private fun resetOtherSelectedItem() {
        menuAdapter.changeSelected(selectedId)
        setColor(selectedItemView!!, "#ffffff")
    }

    private fun setColor(view: View, color: String) {
        view.cardView.setBackgroundColor(Color.parseColor(color))
    }

    private fun toast(str: String) {
        Toast.makeText(this, str, Toast.LENGTH_SHORT).show()
    }
}