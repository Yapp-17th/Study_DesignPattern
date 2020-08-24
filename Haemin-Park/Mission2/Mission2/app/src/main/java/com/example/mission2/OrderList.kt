package com.example.mission2

import android.util.Log
import com.example.mission2.base.BaseObserver
import com.example.mission2.base.BaseSubject

class OrderList(vCallBack: ViewCallBack, pickMenu: BaseSubject): BaseObserver {

    private var pickMenu: BaseSubject
    private lateinit var menuName: String
    private val vCallBack: ViewCallBack

    init {
        Log.d("OrderLst","OrderList init")
        this.pickMenu = pickMenu
        pickMenu.registerObserver(this)
        this.vCallBack = vCallBack
    }
    override fun update(menuName: String) {
        Log.d("OrderLst",menuName+" 주문 준비")
        this.menuName = menuName
        vCallBack.updateText(menuName+" 주문 준비")
    }

    fun orderList(){
        Log.d("OrderLst", "주문완료")
        vCallBack.updateText(menuName+" 주문 완료")
    }
}