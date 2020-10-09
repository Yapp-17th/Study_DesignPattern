package com.example.mission4.model

import java.lang.IllegalArgumentException

class PepperoniPizza(val sizeChoice: String, val totalPrice: Int, val toppingChoice: ArrayList<String>) : Pizza {
    override val name: String
        get() = "페퍼로니 피자"
    override val price: Int
        get() = totalPrice
    override val size: String
        get() = sizeChoice
    override val topping: ArrayList<String>
        get() = toppingChoice
    override val pid = "p1"
}