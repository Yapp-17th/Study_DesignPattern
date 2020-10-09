package com.khb.pizza.pizza

data class SteakPizza(
    override var cheese: ArrayList<String> = arrayListOf("mozzarella", "cheddar"),
    override var price: Int = 24000,
    override var dough: String = "오리지널",
    override var topping: ArrayList<String> = arrayListOf("pepperoni", "olive", "paprika", "steak"),
    override var size: Char = 'M'
) : Pizza