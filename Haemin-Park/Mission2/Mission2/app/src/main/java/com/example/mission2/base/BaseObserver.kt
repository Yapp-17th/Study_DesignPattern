package com.example.mission2.base

import com.example.mission2.MenuItem
import com.example.mission2.OrderData

interface BaseObserver {
    fun update(orderData: OrderData)
}