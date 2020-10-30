package com.example.mission5.adapter

import android.content.Context
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.ImageView
import android.widget.TextView
import androidx.recyclerview.widget.RecyclerView
import com.example.mission5.R
import com.example.mission5.model.Pizza

class OrderAdapter(val context: Context, val pizzaDatas: ArrayList<Pizza>)
    : RecyclerView.Adapter<OrderAdapter.Holder>()
{
    inner class Holder(itemView: View): RecyclerView.ViewHolder(itemView){

        val item_img = itemView.findViewById<ImageView>(R.id.item_img)
        val item_name = itemView.findViewById<TextView>(R.id.item_name)
        val item_size = itemView.findViewById<TextView>(R.id.size)
        val item_topping = itemView.findViewById<TextView>(R.id.topping)
        val item_price = itemView.findViewById<TextView>(R.id.item_price)

        fun bind(pizzaData: Pizza, context: Context){

            item_name.text = pizzaData.type
            item_size.text = pizzaData.size
            item_price.text = pizzaData.price.toString()
            item_topping.text = pizzaData.toppingName

            val resId = context.resources.getIdentifier(pizzaData.name, "drawable","com.example.mission5")
            item_img.setImageResource(resId)

        }
    }

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): Holder {
        val view = LayoutInflater.from(context).inflate(R.layout.order_item, parent, false)
        return Holder(view)
    }

    override fun getItemCount(): Int {
        return pizzaDatas.size
    }

    override fun onBindViewHolder(holder: Holder, position: Int) {
        holder.bind(pizzaDatas[position], context)
    }
}