package com.khb.pizza

import com.khb.pizza.factory.PizzaFactory
import com.khb.pizza.items.Pizza

object Cook {
    private var isCooking = false
    private var factory = PizzaFactory()

    fun getStatus(): Boolean {
        return this.isCooking
    }

    fun orderPizza(name: String, dough: String, size: Char, topping: ArrayList<String>, extra: Int): Pizza? {
//        TODO("PizzaFactory에 orderPizza")
        return null
    }
}