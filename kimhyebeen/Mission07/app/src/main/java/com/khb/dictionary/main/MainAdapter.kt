package com.khb.dictionary.main

import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.TextView
import androidx.recyclerview.widget.RecyclerView
import com.khb.dictionary.R
import com.khb.dictionary.model.DictionaryItem
import kotlinx.android.synthetic.main.item_search.view.*

class MainAdapter: RecyclerView.Adapter<MainAdapter.ItemViewHolder>() {
    private var items: List<DictionaryItem> = listOf()

    fun setItems(list: List<DictionaryItem>) {
        items = list
        notifyDataSetChanged()
    }

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): ItemViewHolder {
        val view = LayoutInflater.from(parent.context)
            .inflate(R.layout.item_search, parent, false)

        return ItemViewHolder(view)
    }

    override fun onBindViewHolder(holder: ItemViewHolder, position: Int)
            = holder.onBind(items[position])

    override fun getItemCount(): Int
            = items.size

    inner class ItemViewHolder(itemView: View)
        : RecyclerView.ViewHolder(itemView) {
        val title: TextView = itemView.item_title_text_view
        val description: TextView = itemView.item_description_text_view

        fun onBind(item: DictionaryItem) {
            title.text = item.title
            description.text = item.description
        }
    }
}