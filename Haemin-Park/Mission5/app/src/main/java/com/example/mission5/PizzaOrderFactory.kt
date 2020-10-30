package com.example.mission5

import com.example.mission5.model.*

class PizzaOrderFactory {

    fun createPizzaOrder(name: String, size: String, price: Int, toppingName: String, toppingPrice: Int) = when(name){
        "pepperonipizza" -> {
            if (toppingPrice != 0)
                PizzaWithTopping(PepperoniPizza(size, price), toppingName, toppingPrice)
            else
                PepperoniPizza(size, price)
        }
        "potatopizza" -> {
            if (toppingPrice != 0)
                PizzaWithTopping(PotatoPizza(size, price), toppingName, toppingPrice)
            else
                PotatoPizza(size, price)
        }
        "sweetpotatopizza" -> {
            if (toppingPrice != 0)
                PizzaWithTopping(SweetPotatoPizza(size, price), toppingName, toppingPrice)
            else
                SweetPotatoPizza(size, price)
        }
        else -> throw IllegalArgumentException("생성할 수 없습니다.")
    }

}