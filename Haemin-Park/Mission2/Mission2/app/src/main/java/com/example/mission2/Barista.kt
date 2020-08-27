package com.example.mission2

import android.os.CountDownTimer
import android.util.Log
import com.example.mission2.base.BaseObserver
import com.example.mission2.base.BaseSubject
import java.lang.String
import java.util.*
import kotlin.concurrent.timer


class Barista(vCallBack: ViewCallBack, pickMenu: BaseSubject, private val handler: android.os.Handler): BaseObserver {

    private var pickMenu: BaseSubject
    private val vCallBack: ViewCallBack
    private var timer: Long = 0L
    private lateinit var countDownTimer: CountDownTimer
    private lateinit var totalTimer: CountDownTimer

    init {
        Log.d("Barista","Barista init")
        this.pickMenu = pickMenu
        this.vCallBack = vCallBack
        pickMenu.registerObserver(this)
    }
    override fun update(orderData: OrderData) {
        Log.d("Barista",orderData.menuItem.getName()+" 주문 접수")
        vCallBack.updateBarista(orderData.menuItem.getName()+" 주문 접수")
        makeCoffee(orderData)
    }
    fun makeCoffee(orderData: OrderData){

        if(timer != 0L){ // 리스타트
            totalTimer.cancel()
        }

        timer += delaytime(orderData.menuItem)

        totalTimer = object : CountDownTimer(timer, 1000) {
            override fun onTick(millisUntilFinished: Long) {
                vCallBack.updateWaitTime(millisUntilFinished/1000L)
                timer -= 1000
            }
            override fun onFinish() {
                timer = 0
            }

        }.start()

        countDownTimer = object : CountDownTimer(timer, 1000) {
            override fun onTick(millisUntilFinished: Long) {
            }
            override fun onFinish() {
                val coffee: Coffee = Coffee(orderData.menuItem)
                Log.d("Barista",orderData.menuItem.getName()+" 제조 완료")
                vCallBack.updateBarista(orderData.menuItem.getName()+" 제조 완료")
                pickMenu.successMenu(OrderData(orderData.index, orderData.num,1, orderData.menuItem))
                vCallBack.updateCustomer("손님 ${orderData.num}: ${orderData.menuItem.getName()} 받음")
            }

        }.start()
    }
    fun delaytime(menuItem: MenuItem) =
        when(menuItem.getName()){
            "ame" -> 3000L
            "cap" -> 5000L
            "car" -> 5000L
            "esp" -> 2000L
            else -> throw IllegalArgumentException("Unknown menu")
        }
}