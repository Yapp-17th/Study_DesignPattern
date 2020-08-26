package com.example.mission2

import android.widget.TextView

interface ViewCallBack{
    fun updateOrderList(re: Boolean, orderData: OrderData)
    fun updateBarista(str: String)
}