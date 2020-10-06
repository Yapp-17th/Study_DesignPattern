package com.example.mission4.adapter

import android.content.Context
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.ImageView
import android.widget.TextView
import androidx.recyclerview.widget.RecyclerView
import com.example.mission4.R
import com.example.mission4.model.Pizza

class OrderAdapter(val context: Context, val pizzaDatas: ArrayList<Pizza>)
    : RecyclerView.Adapter<OrderAdapter.Holder>()
{
    inner class Holder(itemView: View): RecyclerView.ViewHolder(itemView){

        val item_img = itemView.findViewById<ImageView>(R.id.item_img)
        val item_name = itemView.findViewById<TextView>(R.id.item_name)
        val item_price = itemView.findViewById<TextView>(R.id.item_price)

        fun bind(pizzaData: Pizza, context: Context){

            item_name.text = pizzaData.name
            item_price.text = pizzaData.price.toString()

            val resId = context.resources.getIdentifier("p"+pizzaData.price.toString(), "drawable","com.example.mission4")
            item_img.setImageResource(resId)

        }
    }

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): Holder {
        val view = LayoutInflater.from(context).inflate(R.layout.pizza_item, parent, false)
        return Holder(view)
    }

    override fun getItemCount(): Int {
        return pizzaDatas.size
    }

    override fun onBindViewHolder(holder: Holder, position: Int) {
        holder.bind(pizzaDatas[position], context)
    }
}