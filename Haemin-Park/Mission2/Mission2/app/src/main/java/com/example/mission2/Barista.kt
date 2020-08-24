package com.example.mission2

import android.util.Log
import com.example.mission2.base.BaseObserver
import com.example.mission2.base.BaseSubject

class Barista(pickMenu: BaseSubject, private val handler: android.os.Handler): BaseObserver {

    private var pickMenu: BaseSubject
    private lateinit var menuName: String

    init {
        Log.d("Barista","Barista init")
        this.pickMenu = pickMenu
        pickMenu.registerObserver(this)
    }
    override fun update(menuName: String) {
        this.menuName = menuName
        Log.d("Barista",this.menuName+" 주문 접수")
        makeCoffee()
    }
    fun makeCoffee(){
        handler.postDelayed({
            Log.d("Barista",this.menuName+" 주문 완료")
            pickMenu.successMenu()
        },5000)
    }
}