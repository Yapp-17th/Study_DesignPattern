package com.example.mission5.adapter

import android.content.Context
import android.content.Intent
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.ImageView
import android.widget.TextView
import androidx.recyclerview.widget.RecyclerView
import com.example.mission5.R
import com.example.mission5.model.PizzaMenuItem
import com.example.mission5.view.OrderActivity

class PizzaAdapter(val context: Context, val pizzaDatas: ArrayList<PizzaMenuItem>)
    : RecyclerView.Adapter<PizzaAdapter.Holder>()
{
    inner class Holder(itemView: View): RecyclerView.ViewHolder(itemView){

        val item_img = itemView.findViewById<ImageView>(R.id.item_img)
        val item_name = itemView.findViewById<TextView>(R.id.item_name)
        val item_price = itemView.findViewById<TextView>(R.id.item_price)

        fun bind(pizzaData: PizzaMenuItem, context: Context){

            item_name.text = pizzaData.type
            item_price.text = pizzaData.price.toString()

            val resId = context.resources.getIdentifier(pizzaData.name, "drawable","com.example.mission5")
            item_img.setImageResource(resId)

            itemView.setOnClickListener{
                val intent = Intent(context, OrderActivity::class.java)
                intent.putExtra("pizza", pizzaData)
                context.startActivity(intent)
            }

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