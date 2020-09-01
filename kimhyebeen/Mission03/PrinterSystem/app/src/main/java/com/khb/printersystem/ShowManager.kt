package com.khb.printersystem

import com.khb.printersystem.adapter.StatusAdapter
import com.khb.printersystem.item.StatusItem

object ShowManager {
    private var statusAdapter = StatusAdapter()

    fun getAdapter(): StatusAdapter {
        return this.statusAdapter
    }

    fun addStatusItem(item: StatusItem) {
        this.statusAdapter.addItem(item)
    }

    fun changeItemTouchable (item: StatusItem, check: Boolean) {
        this.statusAdapter.changeTouchable(item, check)
    }

    fun changeItemStatus(item: StatusItem, status: String) {
        this.statusAdapter.changeStatus(item, status)
    }
}