package com.khb.pizza.factory

import com.khb.pizza.items.Pizza

class PizzaFactory {
    lateinit var pizza: Pizza
    fun orderPizza(name: String, dough: String, size: Char, topping: ArrayList<String>, extra: Int) {
        // TODO(prepare부터 finish까지 피자 만드는 과정)
    }
    fun prepare() {
        // TODO(0.5초 딜레이, 끝나면 baking을 시작함과 동시에 다른 피자 prepare 시작)
    }
    fun baking() {
        // TODO(피자마다 다르게 딜레이, 해당 view card에 상태 나타내기)
    }
    fun boxing() {
        // TODO(0.5초 딜레이, 해당 view card에 상태 나타내기)
    }
    fun finish() {
        // TODO(1초 딜레이, 해당 view card에 상태 나타내기)
    }
}