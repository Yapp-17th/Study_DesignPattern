package com.example.mission4.model

import com.example.mission4.model.Pizza

class PotatoPizza(val sizeChoice: String, val toppingChoice: String) : Pizza {
    override val name: String
        get() = "포테이포 피자"
    override val price: Int
        get() = when(sizeChoice){
            "medium" -> 16900
            "large" -> 17900
            else -> 15900 // small
        }
    override val size: String
        get() = sizeChoice
    override val topping: String
        get() = toppingChoice
}