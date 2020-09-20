package com.khb.pizza.factory

import com.khb.pizza.model.OrderSheet
import com.khb.pizza.pizza.Pizza

class PizzaFactory {
    private lateinit var pizza: Pizza
    fun orderPizza(sheet: OrderSheet): Pizza {
        TODO("prepare부터 finish까지 피자 만드는 과정")
    }
    private fun prepare() {
        TODO("0.5초 딜레이, 해당 view card에 상태 나타내기")
    }
    private fun baking() {
        TODO("2초 딜레이, 해당 view card에 상태 나타내기")
    }
    private fun boxing() {
        TODO("0.5초 딜레이, 해당 view card에 상태 나타내기")
    }
    private fun getPizza() {
        TODO("1초 딜레이, 해당 view card에 상태 나타내기")
    }
}