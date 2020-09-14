package com.khb.pizza.items

data class SteakPizza(
    override var cheese: String = "슈레드",
    override var price: Int = 24000,
    override var dough: String,
    override var topping: ArrayList<String>,
    override var size: Char
) : Pizza()