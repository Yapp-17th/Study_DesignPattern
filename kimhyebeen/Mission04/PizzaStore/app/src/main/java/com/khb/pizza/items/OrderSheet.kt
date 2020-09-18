package com.khb.pizza.items

data class OrderSheet(
    val name: String,
    val type: String,
    var extra: Int,
    var dough: String,
    var size: Char,
    var extraTopping: ArrayList<String>
)