package com.example.mission2.base

import com.example.mission2.model.OrderData

interface BaseObserver {
    fun update(orderData: OrderData)
}