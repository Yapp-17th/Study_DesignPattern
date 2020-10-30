package com.example.mission5.model

class PepperoniPizza(val sizeChoice: String, val totalPrice: Int) : Pizza() {
    override val type: String
        get() = "페퍼로니 피자"
    override val name: String
        get() = "pepperonipizza"
    override val price: Int
        get() = totalPrice
    override val size: String
        get() = sizeChoice
}