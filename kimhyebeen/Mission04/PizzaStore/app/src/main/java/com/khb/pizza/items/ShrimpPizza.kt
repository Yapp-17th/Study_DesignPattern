package com.khb.pizza.items

data class ShrimpPizza(
    override var cheese: String = "슈레드",
    override var price: Int = 24000,
    override var dough: String = "오리지널",
    override var topping: ArrayList<String>,
    override var size: Char = 'M'
) : Pizza()