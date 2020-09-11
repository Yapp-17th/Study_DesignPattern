package com.example.mission3.adapter

import android.content.Context
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.ImageView
import android.widget.TextView
import androidx.recyclerview.widget.RecyclerView
import com.example.mission3.model.Print
import com.example.mission3.R

class PrintAdapter(val context: Context, val printDatas: ArrayList<Print>)
    : RecyclerView.Adapter<PrintAdapter.Holder>()
{
    inner class Holder(itemView: View): RecyclerView.ViewHolder(itemView){

        val item_img = itemView.findViewById<ImageView>(R.id.printImg)
        val item_text = itemView.findViewById<TextView>(R.id.item_text)

        fun bind(printData: Print, context: Context){
            if(printData.status){
                when(printData.fileNm){
                    "토끼.PNG" -> item_img.setImageResource(R.drawable.s)
                    "물범.PNG" -> item_img.setImageResource(R.drawable.a)
                    "공룡.PNG" -> item_img.setImageResource(R.drawable.j)
                }
            }
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