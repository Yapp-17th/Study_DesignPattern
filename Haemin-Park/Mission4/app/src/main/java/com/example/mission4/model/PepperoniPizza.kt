package com.example.mission4.model

class PepperoniPizza(val sizeChoice: String, val toppingChoice: String) : Pizza {
    override val price: Int
        get() = when(sizeChoice){
            "medium" -> 15900
            "large" -> 16900
            else -> 14900 // small
        }
    override val size: String
        get() = sizeChoice
    override val topping: String
        get() = toppingChoice
}