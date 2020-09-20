package com.khb.pizza

import com.khb.pizza.factory.PizzaFactory
import com.khb.pizza.model.OrderSheet
import com.khb.pizza.pizza.Pizza

object Cook {
    private var status = true
    private var factory = PizzaFactory()

    fun getStatus(): Boolean {
        return this.status
    }

    fun orderPizza(sheet: OrderSheet): Pizza {
        TODO("PizzaFactory에 피자를 주문하고 일정 시간 뒤에 피자를 받는다")
    }
}