package com.khb.pizza.items

import com.khb.pizza.User

data class OrderSheet(
    val user: User,
    val type: String,
    var extra: Int,
    var dough: String,
    var size: Char,
    var extraTopping: ArrayList<String>?
)