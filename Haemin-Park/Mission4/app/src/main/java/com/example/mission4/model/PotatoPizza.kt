package com.example.mission4.model

import com.example.mission4.model.Pizza
import java.lang.IllegalArgumentException

class PotatoPizza(val sizeChoice: String, val totalPrice: Int, val toppingChoice: ArrayList<String>) : Pizza {
    override val name: String
        get() = "포테이토 피자"
    override val price: Int
        get() = totalPrice
    override val size: String
        get() = sizeChoice
    override val topping: ArrayList<String>
        get() = toppingChoice
    override val pid = "p2"
}