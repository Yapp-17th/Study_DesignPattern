package com.example.mission4.model

import com.example.mission4.model.Pizza

class SweetPotatoPizza (val sizeChoice: String, val toppingChoice: String) : Pizza {
    override val name: String
        get() = "고구마 피자"
    override val price: Int
        get() = when(sizeChoice){
            "medium" -> 17900
            "large" -> 18900
            else -> 16900 // small
        }
    override val size: String
        get() = sizeChoice
    override val topping: String
        get() = toppingChoice
}