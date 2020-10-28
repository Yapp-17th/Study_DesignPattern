package com.khb.customburger.viewmodel

import android.view.View
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel
import com.khb.customburger.Burger

class BurgerViewModel: ViewModel() {
    private val burgerRepo = BurgerRepository()
    private val decoRepo = DecoRepository()

    val cabbage: MutableLiveData<Boolean> get() = burgerRepo.cabbage
    val cheese: MutableLiveData<Boolean> get() = burgerRepo.cheese
    val shrimp: MutableLiveData<Boolean> get() = burgerRepo.shrimp
    val tomato: MutableLiveData<Boolean> get() = burgerRepo.tomato
    val porkPatty: MutableLiveData<Boolean> get() = burgerRepo.porkPatty
    val chickenPatty: MutableLiveData<Boolean> get() = burgerRepo.chickenPatty

    fun getDecoBurger(list: List<String>): Burger {
        return decoRepo.makeBurger(list)
    }

    fun getBurgerList(): MutableList<MutableLiveData<Boolean>> {
        return burgerRepo.getBurgerList()
    }

    fun checkCabbage(view: View) {
        burgerRepo.changeFlag(0)
    }

    fun checkCheese(view: View) {
        burgerRepo.changeFlag(1)
    }

    fun checkShrimp(view: View) {
        burgerRepo.changeFlag(2)
    }

    fun checkTomato(view: View) {
        burgerRepo.changeFlag(3)
    }

    fun checkPatty1(view: View) {
        burgerRepo.changeFlag(4)
    }

    fun checkPatty2(view: View) {
        burgerRepo.changeFlag(5)
    }
}