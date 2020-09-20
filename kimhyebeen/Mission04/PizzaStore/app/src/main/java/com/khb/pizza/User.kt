package com.khb.pizza

import java.io.Serializable

data class User(
    val name: String,
    val address: String,
    val number: String
): Serializable