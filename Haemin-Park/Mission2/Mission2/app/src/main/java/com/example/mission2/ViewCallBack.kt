package com.example.mission2

import android.widget.TextView

interface ViewCallBack{
    fun updateCustomer(str: String)
    fun updateOrderList(re: Boolean, orderData: OrderData)
    fun updateBarista(str: String)
    fun updateWaitTime(time: Long)
}