package com.khb.pizza.model

data class Menu(
    var isSelected: Boolean = false,
    val image: Int,
    val name: String,
    val price: Int
)