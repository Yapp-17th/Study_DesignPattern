package com.khb.customburger.viewmodel

import android.view.View
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel

class BurgerViewModel: ViewModel() {
    private val repository = BurgerRepository()

    val cabbage: MutableLiveData<Boolean> get() = repository.cabbage
    val cheese: MutableLiveData<Boolean> get() = repository.cheese
    val shrimp: MutableLiveData<Boolean> get() = repository.shrimp
    val tomato: MutableLiveData<Boolean> get() = repository.tomato
    val porkPatty: MutableLiveData<Boolean> get() = repository.porkPatty
    val chickenPatty: MutableLiveData<Boolean> get() = repository.chickenPatty

    fun getBurgerList(): MutableList<MutableLiveData<Boolean>> {
        return repository.getBurgerList()
    }

    fun checkCabbage(view: View) {
        repository.changeFlag(0)
    }

    fun checkCheese(view: View) {
        repository.changeFlag(1)
    }

    fun checkShrimp(view: View) {
        repository.changeFlag(2)
    }

    fun checkTomato(view: View) {
        repository.changeFlag(3)
    }

    fun checkPatty1(view: View) {
        repository.changeFlag(4)
    }

    fun checkPatty2(view: View) {
        repository.changeFlag(5)
    }
}