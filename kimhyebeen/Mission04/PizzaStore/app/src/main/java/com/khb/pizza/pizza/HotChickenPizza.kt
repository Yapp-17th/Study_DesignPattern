package com.khb.pizza.pizza

data class HotChickenPizza(
    override var cheese: ArrayList<String> = arrayListOf("mozzarella", "cheddar"),
    override var price: Int = 18000,
    override var dough: String = "original",
    override var topping: ArrayList<String> = arrayListOf("pepperoni", "olive", "paprika"),
    override var size: Char = 'M'
) : Pizza