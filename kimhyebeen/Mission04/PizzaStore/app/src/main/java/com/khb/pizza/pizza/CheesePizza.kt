package com.khb.pizza.pizza

data class CheesePizza(
    override var cheese: ArrayList<String> = arrayListOf("mozzarella"),
    override var price: Int = 8000,
    override var dough: String = "original",
    override var topping: ArrayList<String> = arrayListOf("olive"),
    override var size: Char = 'M'
) : Pizza