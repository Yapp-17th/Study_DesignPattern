package com.example.mission5.model

class PizzaWithTopping(private val pizza: Pizza, toppingName: String, toppingPrice: Int): PizzaDecorator() {
    override val type: String
        get() = pizza.type + " with " + toppingName
    override val toppingName = toppingName
    override val toppingPrice = toppingPrice
    override val name: String
        get() = pizza.toppingName
    override val price: Int
        get() = pizza.price
    override val size: String
        get() = pizza.size
}