package com.khb.pizza.items

data class PepperoniPizza(
    override var cheese: String = "모짜렐라",
    override var price: Int = 10000,
    override var dough: String = "오리지널",
    override var topping: ArrayList<String>,
    override var size: Char = 'M'
) : Pizza()