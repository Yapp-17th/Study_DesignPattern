package com.khb.printersystem.adapter

import android.graphics.Color
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.recyclerview.widget.RecyclerView
import com.khb.printersystem.R
import com.khb.printersystem.item.StatusItem
import kotlinx.android.synthetic.main.item_status.view.*

class StatusAdapter : RecyclerView.Adapter<StatusAdapter.ItemViewHolder>() {
    var itemList = ArrayList<StatusItem>()

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): ItemViewHolder {
        var view = LayoutInflater.from(parent.context).inflate(R.layout.item_status, parent, false)

        return ItemViewHolder(view)
    }

    override fun onBindViewHolder(holder: ItemViewHolder, position: Int) {
        holder.onBind(position)
    }

    override fun getItemCount(): Int {
        return itemList.size
    }

    fun addItem(item: StatusItem) {
        itemList.add(item)
        notifyDataSetChanged()
    }

    fun changeStatus(item: StatusItem, status: String) {
        itemList[itemList.indexOf(item)].status = status
        notifyDataSetChanged()
    }

    fun changeTouchable(item: StatusItem, check: Boolean) {
        itemList[itemList.indexOf(item)].touchable = check
        notifyDataSetChanged()
    }

    inner class ItemViewHolder(itemView: View) : RecyclerView.ViewHolder(itemView) {
        val timeText = itemView.timeTextView
        val statusText = itemView.statusTextView

        fun onBind(i: Int) {
            timeText.text = itemList[i].time
            statusText.text = itemList[i].status
            itemView.isClickable = itemList[i].touchable

            if (statusText.text == "출력 중") {
                itemView.setBackgroundColor(Color.parseColor("#FFF6EFC9"))
            } else if (statusText.text == "출력 완료")
                itemView.setBackgroundColor(Color.parseColor("#FFDCF6BD"))

            itemView.setOnClickListener {
                TODO("dialog 띄우기")
            }
        }
    }
}