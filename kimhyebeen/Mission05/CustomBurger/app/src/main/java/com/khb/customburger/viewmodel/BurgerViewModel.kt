package com.khb.customburger.viewmodel

import android.view.View
import androidx.lifecycle.LiveData
import androidx.lifecycle.ViewModel
import com.khb.customburger.Material

class BurgerViewModel: ViewModel() {
    private val _burgerList = ArrayList<Material>()

    init {
        _burgerList.apply {
            add(Material("cabbage", 3))
            add(Material("cheese", 10))
            add(Material("shrimp", 12))
            add(Material("tomato", 5))
            add(Material("patty01", 24))
            add(Material("patty02", 22))
        }
    }

    val flagCabbage: LiveData<Boolean> get() = _burgerList[0].selected
    val flagCheese: LiveData<Boolean> get() = _burgerList[1].selected
    val flagShrimp: LiveData<Boolean> get() = _burgerList[2].selected
    val flagTomato: LiveData<Boolean> get() = _burgerList[3].selected
    val flagPatty1: LiveData<Boolean> get() = _burgerList[4].selected
    val flagPatty2: LiveData<Boolean> get() = _burgerList[5].selected

    fun getBurgerList(): ArrayList<Material> {
        return _burgerList
    }

    fun checkCabbage(view: View) {
        _burgerList[0].changeSelected()
    }

    fun checkCheese(view: View) {
        _burgerList[1].changeSelected()
    }

    fun checkShrimp(view: View) {
        _burgerList[2].changeSelected()
    }

    fun checkTomato(view: View) {
        _burgerList[3].changeSelected()
    }

    fun checkPatty1(view: View) {
        _burgerList[4].changeSelected()
    }

    fun checkPatty2(view: View) {
        _burgerList[5].changeSelected()
    }
}