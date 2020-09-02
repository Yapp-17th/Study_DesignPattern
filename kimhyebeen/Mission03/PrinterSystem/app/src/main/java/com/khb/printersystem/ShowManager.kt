package com.khb.printersystem

import com.khb.printersystem.adapter.StatusAdapter
import com.khb.printersystem.item.PrintItem

object ShowManager {
    private var statusAdapter = StatusAdapter()

    fun getAdapter(): StatusAdapter {
        return this.statusAdapter
    }

    fun addStatusItem(item: PrintItem) {
        this.statusAdapter.addItem(item)
    }

    fun changeItemTouchable (item: PrintItem, check: Boolean) {
        this.statusAdapter.changeTouchable(item, check)
    }

    fun changeItemStatus(item: PrintItem, status: String) {
        this.statusAdapter.changeStatus(item, status)
    }
}