package com.khb.coffeesystem

import android.graphics.drawable.Drawable
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.recyclerview.widget.RecyclerView
import com.khb.coffeesystem.model.CustomerViewItem
import kotlinx.android.synthetic.main.item_customer.view.*

class CustomerAdapter: RecyclerView.Adapter<CustomerAdapter.ItemViewHolder>() {
    private var itemList = ArrayList<CustomerViewItem>()

    override fun onCreateViewHolder(
        parent: ViewGroup,
        viewType: Int
    ): CustomerAdapter.ItemViewHolder {
        var view = LayoutInflater.from(parent.context).inflate(R.layout.item_customer, parent, false)

        return ItemViewHolder(view)
    }

    override fun getItemCount(): Int {
        return itemList.size
    }

    override fun onBindViewHolder(holder: CustomerAdapter.ItemViewHolder, position: Int) {
        holder.onBind(position)
    }

    fun addItem(item: CustomerViewItem) {
        itemList.add(item)
        notifyDataSetChanged()
    }

    fun removeItem(item: CustomerViewItem) {
        var index = itemList.indexOf(item)
        itemList.removeAt(index)
        notifyItemRemoved(index)
    }

    inner class ItemViewHolder(itemView: View): RecyclerView.ViewHolder(itemView) {
        val name = itemView.customerNameText
        val image = itemView.customerImage
        val coffee = itemView.coffeeNameText

        fun onBind(i: Int) {
            // image 랜덤으로 넣기
            name.text = itemList[i].name
            image.setImageResource(itemList[i].image)
            coffee.text = itemList[i].coffee
        }
    }

}