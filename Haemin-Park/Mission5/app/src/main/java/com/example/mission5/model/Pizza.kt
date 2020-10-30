package com.example.mission5.model

abstract class Pizza(toppingName: String = "", toppingPrice: Int = 0) {

    abstract val type: String
    abstract val name: String
    abstract val price: Int
    abstract val size: String

    open val toppingName = toppingName
    open val toppingPrice = toppingPrice
}