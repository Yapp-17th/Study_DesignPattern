package com.khb.pizza.pizza

data class PotatoPizza(
    override var cheese: ArrayList<String> = arrayListOf("mozzarella"),
    override var price: Int = 12000,
    override var dough: String = "original",
    override var topping: ArrayList<String> = arrayListOf("pepperoni", "olive", "paprika", "potato"),
    override var size: Char = 'M'
) : Pizza