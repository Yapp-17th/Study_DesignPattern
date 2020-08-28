package com.example.mission2

import com.example.mission2.model.OrderData

interface ViewCallBack{
    fun updateCustomer(str: String)
    fun updateOrderList(re: Boolean, orderData: OrderData)
    fun updateBarista(str: String)
    fun updateWaitTime(time: Long)
}