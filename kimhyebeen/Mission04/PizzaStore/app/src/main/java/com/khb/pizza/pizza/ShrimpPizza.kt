package com.khb.pizza.pizza

data class ShrimpPizza(
    override var cheese: ArrayList<String> = arrayListOf("mozzarella", "cheddar"),
    override var price: Int = 20000,
    override var dough: String = "original",
    override var topping: ArrayList<String> = arrayListOf("pepperoni", "olive", "paprika", "shrimp"),
    override var size: Char = 'M'
) : Pizza