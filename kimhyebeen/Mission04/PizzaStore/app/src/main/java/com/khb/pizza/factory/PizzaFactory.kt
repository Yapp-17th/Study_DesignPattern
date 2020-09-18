package com.khb.pizza.factory

import com.khb.pizza.items.OrderSheet
import com.khb.pizza.items.Pizza

class PizzaFactory {
    lateinit var pizza: Pizza
    fun orderPizza(sheet: OrderSheet) {
        // TODO(prepare부터 finish까지 피자 만드는 과정)
    }
    fun prepare() {
        // TODO(0.5초 딜레이, 끝나면 baking을 시작)
    }
    fun baking() {
        // TODO(2초 딜레이)
    }
    fun boxing() {
        // TODO(0.5초 딜레이, 해당 view card에 상태 나타내기)
    }
    fun getPizza() {
        // TODO(1초 딜레이, 해당 view card에 상태 나타내기)
    }
}