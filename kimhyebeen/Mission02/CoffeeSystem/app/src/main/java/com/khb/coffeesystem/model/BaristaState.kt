package com.khb.coffeesystem.model

object BaristaState {
    private var totalBarista = 2

    fun addTotalBarista() {
        this.totalBarista++
        Cashier.update()
    }

    fun removeTotalBarista() {
        this.totalBarista--
    }

    fun getTotalbarista(): Int {
        return this.totalBarista
    }
}