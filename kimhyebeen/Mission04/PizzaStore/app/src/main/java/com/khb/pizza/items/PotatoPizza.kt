package com.khb.pizza.items

data class PotatoPizza(
    val extra: Int,
    val extraTopping: List<String>?
) : Pizza(extra, extraTopping) {
    override var cheese: ArrayList<String> = arrayListOf("mozzarella")
    override var price: Int = 12000
    override var dough: String = "original"
    override var topping: ArrayList<String> = arrayListOf("pepperoni", "olive", "paprika", "potato")
    override var size: Char = 'M'
}