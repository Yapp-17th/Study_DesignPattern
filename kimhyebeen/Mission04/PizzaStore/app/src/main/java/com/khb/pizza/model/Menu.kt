package com.khb.pizza.model

import java.io.Serializable

data class Menu(
    var isSelected: Boolean = false,
    val image: Int,
    val name: String,
    val price: Int
): Serializable