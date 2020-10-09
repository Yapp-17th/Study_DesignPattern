package com.khb.pizza.model

import java.io.Serializable

data class User(
    val name: String,
    val address: String,
    val number: String
): Serializable