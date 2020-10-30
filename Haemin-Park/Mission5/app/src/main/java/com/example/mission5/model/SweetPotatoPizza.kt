package com.example.mission5.model

class SweetPotatoPizza (val sizeChoice: String, val totalPrice: Int) : Pizza() {
    override val type: String
        get() = "고구마 피자"
    override val name: String
        get() = "sweetpotatopizza"
    override val price: Int
        get() = totalPrice
    override val size: String
        get() = sizeChoice
}