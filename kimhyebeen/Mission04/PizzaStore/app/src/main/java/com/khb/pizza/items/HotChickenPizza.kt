package com.khb.pizza.items

data class HotChickenPizza(
    val extra: Int,
    val extraTopping: List<String>?
) : Pizza(extra, extraTopping) {
    override var cheese: ArrayList<String> = arrayListOf("mozzarella", "cheddar")
    override var price: Int = 18000
    override var dough: String = "original"
    override var topping: ArrayList<String> = arrayListOf("pepperoni", "olive", "paprika")
    override var size: Char = 'M'
}