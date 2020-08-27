package com.example.mission2

import android.content.Context
import android.util.Log
import com.example.mission2.adapter.OrderAdapter
import com.example.mission2.base.BaseObserver
import com.example.mission2.base.BaseSubject

class OrderList(vCallBack: ViewCallBack, pickMenu: BaseSubject): BaseObserver {

    private var pickMenu: BaseSubject
    private val vCallBack: ViewCallBack

    init {
        Log.d("OrderLst","OrderList init")
        this.pickMenu = pickMenu
        pickMenu.registerObserver(this)
        this.vCallBack = vCallBack
    }
    override fun update(orderData: OrderData) {
        Log.d("OrderLst",orderData.menuItem.getName()+" 주문 준비")
        vCallBack.updateOrderList(false, orderData)
    }

    fun orderList(orderData: OrderData){
        Log.d("OrderLst", "주문완료")
        vCallBack.updateOrderList(true, orderData)
   }
}