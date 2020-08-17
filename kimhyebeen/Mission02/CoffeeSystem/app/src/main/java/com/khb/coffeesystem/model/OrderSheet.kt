package com.khb.coffeesystem.model

import com.khb.coffeesystem.Customer

data class OrderSheet (
    val customer: Customer,
    val menu: MenuItem
)