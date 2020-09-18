package com.khb.pizza.items

import org.junit.jupiter.api.Test
import org.junit.jupiter.api.Assertions.*

internal class PizzaTest {
    private val exPizza = PotatoPizza(1000, listOf("pineapple"))

    @Test
    fun getPrice() {
        val price = exPizza.price

        assertTrue(price == 13000)
    }

    @Test
    fun getTopping() {
        val toppings = exPizza.topping

        assertTrue(toppings.size == 5)
        assertTrue(toppings.contains("pineapple"))
    }

    @Test
    fun changeDough() {
        val before = exPizza.dough

        exPizza.changeDough("thin")
        val after = exPizza.dough

        assertTrue(after == "thin")
        assertNotSame(before, after)
    }

    @Test
    fun upgradeSize() {
        val beforeSize = exPizza.size
        val beforePrice = exPizza.price
        exPizza.upgradeSize()
        val afterSize = exPizza.size
        val afterPrice = exPizza.price

        assertNotSame(beforeSize, afterSize)
        assertTrue(beforePrice < afterPrice)
    }
}