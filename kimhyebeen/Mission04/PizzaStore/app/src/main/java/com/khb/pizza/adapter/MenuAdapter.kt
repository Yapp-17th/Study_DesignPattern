package com.khb.pizza.adapter

import android.annotation.SuppressLint
import android.content.Context
import android.graphics.Color
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.BaseAdapter
import android.widget.ImageView
import android.widget.LinearLayout
import android.widget.TextView
import com.khb.pizza.R
import com.khb.pizza.model.Menu
import kotlinx.android.synthetic.main.item_menu.view.*

class MenuAdapter: BaseAdapter() {
    private var items: ArrayList<Menu> = arrayListOf()

    override fun getCount(): Int {
        return items.size
    }

    override fun getItem(position: Int): Any {
        return items[position]
    }

    override fun getItemId(position: Int): Long {
        return position.toLong()
    }

    fun addItem(item: Menu) {
        items.add(item)
    }

    fun changeSelected(position: Int) {
        items[position].isSelected = !items[position].isSelected
        notifyDataSetChanged()
    }

    override fun getView(position: Int, convertView: View?, parent: ViewGroup?): View {
        val view: MenuItemView =
            convertView?.let {
                convertView as MenuItemView
            } ?: MenuItemView(parent!!.context)

        view.apply {
            setImage(items[position].image)
            setName(items[position].name)
            setPrice(items[position].price)

            if (items[position].isSelected) cardView.setCardBackgroundColor(Color.parseColor("#DADFFF"))
            else cardView.setCardBackgroundColor(Color.parseColor("#ffffff"))

            return this
        }
    }

    inner class MenuItemView(context: Context): LinearLayout(context) {
        private val imageView: ImageView
        private val nameTextView: TextView
        private val priceTextView: TextView

        init {
            var inflater = context.getSystemService(Context.LAYOUT_INFLATER_SERVICE) as LayoutInflater
            inflater.inflate(R.layout.item_menu, this, true)

            imageView = pizzaImageView
            nameTextView = pizzaNameTextView
            priceTextView = pizzaPriceTextView
        }

        fun setImage(id: Int) {
            imageView.setImageResource(id)
        }

        fun setName(name: String) {
            nameTextView.text = name
        }

        @SuppressLint("SetTextI18n")
        fun setPrice(price: Int) {
            priceTextView.text = "${price}원"
        }
    }
}