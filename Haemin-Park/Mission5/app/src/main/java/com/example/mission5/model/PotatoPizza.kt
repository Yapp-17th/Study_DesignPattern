package com.example.mission5.model

class PotatoPizza(val sizeChoice: String, val totalPrice: Int) : Pizza() {
    override val type: String
        get() = "포테이토 피자"
    override val name: String
        get() = "potatopizza"
    override val price: Int
        get() = totalPrice
    override val size: String
        get() = sizeChoice
}