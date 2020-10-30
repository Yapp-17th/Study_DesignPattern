package com.khb.customburger.viewmodel

import com.khb.customburger.BasicBurger
import com.khb.customburger.Burger
import com.khb.customburger.concretedecorator.*
import java.lang.Exception

class DecoRepository {

    fun makeBurger(materials: List<String>): Burger {
        var burger: Burger = BasicBurger()
        materials.map {
            burger = getDecoBurger(burger, it)
        }
        return burger
    }

    private fun getDecoBurger(burger: Burger, str: String): Burger {
        return when (str) {
            "cabbage" -> Cabbage(burger)
            "cheese" -> Cheese(burger)
            "shrimp" -> Shrimp(burger)
            "tomato" -> Tomato(burger)
            "patty01" -> PorkPatty(burger)
            "patty02" -> ChickenPatty(burger)
            else -> throw Exception("DecoRepository-getDecoBurger : type is wrong")
        }
    }
}