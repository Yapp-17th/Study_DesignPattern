package com.khb.cafesystem

import android.annotation.SuppressLint
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.TextView
import androidx.recyclerview.widget.RecyclerView
import com.khb.cafesystem.items.MenuItem
import kotlinx.android.synthetic.main.item_menu_list.view.*

class MenuAdapter : RecyclerView.Adapter<MenuAdapter.ItemViewHolder>() {
    private var menuList = ArrayList<MenuItem>()

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): ItemViewHolder {
        var view = LayoutInflater.from(parent.context).inflate(R.layout.item_menu_list, parent, false)

        return ItemViewHolder(view)
    }

    override fun getItemCount(): Int {
        return this.menuList.size
    }

    override fun onBindViewHolder(holder: ItemViewHolder, position: Int) {
        holder.onBind(position)
    }

    fun addItem(item: MenuItem) {
        menuList.add(item)

        notifyDataSetChanged()
    }

    inner class ItemViewHolder(itemView: View) : RecyclerView.ViewHolder(itemView) {
        private val itemMenuNameTextView: TextView = itemView.itemMenuNameTextView
        private val itemMenuPriceTextView: TextView = itemView.itemMenuPriceTextView

        @SuppressLint("SetTextI18n")
        fun onBind(i: Int) {
            itemMenuNameTextView.text = menuList.get(i).getMenuName()
            itemMenuPriceTextView.text = "${menuList[i].getCost()} 원"
        }
    }
}