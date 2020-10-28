package com.khb.customburger.viewmodel

import android.view.View
import androidx.lifecycle.MutableLiveData

class BurgerRepository {
    private var _burgerList: MutableList<MutableLiveData<Boolean>> = MutableList(6) { MutableLiveData() }

    init {
        _burgerList.map { it.value = false }
    }

    val cabbage: MutableLiveData<Boolean> get() = _burgerList[0]
    val cheese: MutableLiveData<Boolean> get() = _burgerList[1]
    val shrimp: MutableLiveData<Boolean> get() = _burgerList[2]
    val tomato: MutableLiveData<Boolean> get() = _burgerList[3]
    val porkPatty: MutableLiveData<Boolean> get() = _burgerList[4]
    val chickenPatty: MutableLiveData<Boolean> get() = _burgerList[5]

    fun getBurgerList(): MutableList<MutableLiveData<Boolean>> {
        return this._burgerList
    }

    fun changeFlag(id: Int) {
        _burgerList[id].value = !_burgerList[id].value!!
    }
}