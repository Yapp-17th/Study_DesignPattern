package com.example.mission2.model

class MenuItem(name: String, price: Int) {

    private var name: String
    private var price: Int

    init {

        this.name = name
        this.price = price
    }

    fun cost() = price
    fun getName() = name

}