package com.khb.pizza

import com.khb.pizza.factory.PizzaFactory

object Cook {
    var isCooking = false
    var factory = PizzaFactory()

    fun orderPizza(name: String, dough: String, size: Char, topping: ArrayList<String>, extra: Int) {
        // TODO(PizzaFactory에 orderPizza)
    }
}