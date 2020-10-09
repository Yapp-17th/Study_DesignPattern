package com.khb.pizza.model

data class OrderSheet(
    val user: User,
    val type: String,
    var extra: Int,
    var dough: String,
    var size: Char,
    var extraTopping: ArrayList<String>?
)