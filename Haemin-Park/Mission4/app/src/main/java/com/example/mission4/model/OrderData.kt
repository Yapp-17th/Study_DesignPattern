package com.example.mission4.model

object OrderData {
    private var orderData = ArrayList<Pizza>()
    private var totalPrice = 0

    fun addOrder(order: Pizza){
        orderData.add(order)
        totalPrice += order.price
    }

    fun resetOrder(){
        orderData.clear()
        totalPrice = 0
    }

    fun orderDataSize() = orderData.size

    fun orderDataList() = orderData

    fun totalOrderPrice() =  totalPrice
}