package com.khb.pizza.pizza

data class PepperoniPizza(
    val extra: Int,
    val extraTopping: List<String>?
) : Pizza(extra, extraTopping) {
    override var cheese: ArrayList<String> = arrayListOf("mozzarella")
    override var price: Int = 10000
    override var dough: String = "오리지널"
    override var topping: ArrayList<String> = arrayListOf("pepperoni", "olive", "paprika")
    override var size: Char = 'M'
}