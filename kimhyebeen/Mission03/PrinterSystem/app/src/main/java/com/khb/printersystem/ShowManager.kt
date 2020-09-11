package com.khb.printersystem

import com.khb.printersystem.adapter.StatusAdapter
import com.khb.printersystem.item.PrintItem
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.GlobalScope
import kotlinx.coroutines.launch

object ShowManager {
    private var statusAdapter = StatusAdapter()

    fun getAdapter(): StatusAdapter {
        return this.statusAdapter
    }

    fun addStatusItem(item: PrintItem) {
        this.statusAdapter.addItem(item)
    }

    fun changeItemStatus(item: PrintItem, status: String) {
        GlobalScope.launch(Dispatchers.Main) { statusAdapter.changeStatus(item, status) }
    }
}