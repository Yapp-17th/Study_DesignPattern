package com.example.mission3.adapter

import android.content.Context
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.TextView
import androidx.recyclerview.widget.RecyclerView
import com.example.mission3.Print
import com.example.mission3.R
import kotlinx.android.synthetic.main.item.view.*

class PrintAdapter(val context: Context, val printDatas: ArrayList<Print>)
    : RecyclerView.Adapter<PrintAdapter.Holder>()
{
    inner class Holder(itemView: View): RecyclerView.ViewHolder(itemView){

        val item_text = itemView.findViewById<TextView>(R.id.item_text)

        fun bind(printData: Print, context: Context){
            item_text.text = printData.fileNm
        }
    }

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): Holder {
        val view = LayoutInflater.from(context).inflate(R.layout.item, parent, false)
        return Holder(view)
    }

    override fun getItemCount(): Int {
        return printDatas.size
    }

    override fun onBindViewHolder(holder: Holder, position: Int) {
        holder.bind(printDatas[position], context)
    }
}