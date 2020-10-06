package com.example.mission4.model

object OrderData {
    private val orderData = ArrayList<Pizza>()

    fun addOrder(order: Pizza){
        orderData.add(order)
    }

    fun orderSize(): Int{
        return orderData.size
    }

    fun orderDataList(): ArrayList<Pizza>{
        return orderData
    }
}