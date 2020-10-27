package com.khb.customburger.viewmodel

import android.app.Application
import android.view.View
import androidx.lifecycle.AndroidViewModel
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel

class BurgerViewModel: ViewModel() {
    var _burgerList: MutableList<MutableLiveData<Boolean>> = MutableList(6) { MutableLiveData() }

    init {
        // TODO("데이터베이스 사이즈가 0이면 초기값을 insert해주고, 아니면 꺼내서 수정하는 식으로 리팩토링")
        // TODO("데이터베이스 사이즈가 0이 아니면 selected를 모두 false로 바꿔줘요")
        _burgerList.map { it.value = false }
    }

    private fun changeFlag(id: Int) {
        _burgerList[id].value = !_burgerList[id].value!!
    }

    fun checkCabbage(view: View) {
        changeFlag(0)
    }

    fun checkCheese(view: View) {
        changeFlag(1)
    }

    fun checkShrimp(view: View) {
        changeFlag(2)
    }

    fun checkTomato(view: View) {
        changeFlag(3)
    }

    fun checkPatty1(view: View) {
        changeFlag(4)
    }

    fun checkPatty2(view: View) {
        changeFlag(5)
    }
}