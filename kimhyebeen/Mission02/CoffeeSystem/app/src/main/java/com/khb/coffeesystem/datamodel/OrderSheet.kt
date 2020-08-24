package com.khb.coffeesystem.datamodel

import com.khb.coffeesystem.model.Customer

data class OrderSheet (
    val customer: Customer,
    val menu: MenuItem
)