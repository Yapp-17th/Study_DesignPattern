package com.example.mission2.adapter

import android.annotation.SuppressLint
import android.content.Context
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.TextView
import androidx.cardview.widget.CardView
import androidx.recyclerview.widget.RecyclerView
import com.example.mission2.OrderData
import com.example.mission2.R

class OrderAdapter(val context: Context, val orderDatas: ArrayList<OrderData>)
    : RecyclerView.Adapter<OrderAdapter.Holder>() {

    inner class Holder(itemView: View) : RecyclerView.ViewHolder(itemView){

        val index = itemView.findViewById<TextView>(R.id.index)
        val onum = itemView.findViewById<TextView>(R.id.onum)
        val onm = itemView.findViewById<TextView>(R.id.onm)
        val state = itemView.findViewById<TextView>(R.id.state)

        fun bind(orderData: OrderData, context: Context){

            index.setText("주문 "+orderData.index.toString())
            onum.setText("손님 "+orderData.num.toString())
            onm.setText(orderData.menuItem.getName())

            if(orderData.state == 0)
                state.setText("[제조중]")
            else if(orderData.state == 1)
                state.setText("[제조완료]")

        }
    }

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): Holder {
        val view = LayoutInflater.from(context).inflate(R.layout.o_item, parent, false)
        return Holder(view)
    }

    override fun getItemCount(): Int {
        return orderDatas.size
    }

    @SuppressLint("ResourceAsColor")
    override fun onBindViewHolder(holder: Holder, position: Int) {
        holder.bind(orderDatas[position], context)
    }
}