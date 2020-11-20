package com.khb.dictionary.adapter

import android.view.LayoutInflater
import android.view.ViewGroup
import androidx.recyclerview.widget.RecyclerView
import com.khb.dictionary.databinding.ItemSearchBinding
import com.khb.dictionary.model.DictionaryItem

class SearchAdapter: RecyclerView.Adapter<SearchAdapter.ItemViewHolder>() {
    private var items: List<DictionaryItem> = listOf()

    inner class ItemViewHolder(
            private var itemBinding: ItemSearchBinding
    ): RecyclerView.ViewHolder(itemBinding.root) {
        fun onBind(item: DictionaryItem) {
            itemBinding.dictionary = item
        }
    }

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): ItemViewHolder {
        LayoutInflater.from(parent.context).let {
            val binding = ItemSearchBinding.inflate(it, parent, false)
            return ItemViewHolder(binding)
        }
    }

    override fun onBindViewHolder(holder: ItemViewHolder, position: Int) = holder.onBind(items[position])

    override fun getItemCount(): Int = items.size

    fun setContents(data: List<DictionaryItem>) {
        items = data
        notifyDataSetChanged()
    }
}