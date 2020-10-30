package com.example.mission5

import com.example.mission5.model.PepperoniPizza
import com.example.mission5.model.PepperoniPizzaWithTopping
import com.example.mission5.model.PotatoPizza
import com.example.mission5.model.SweetPotatoPizza

class PizzaOrderFactory {

    fun createPizzaOrder(name: String, size: String, price: Int, toppingName: String, toppingPrice: Int) = when(name){
        "pepperonipizza" -> {
            if (toppingPrice != 0)
                PepperoniPizzaWithTopping(PepperoniPizza(size, price), toppingName, toppingPrice)
            else
                PepperoniPizza(size, price)
        }
        "potatopizza" -> {
            if (toppingPrice != 0)
                PepperoniPizzaWithTopping(PepperoniPizza(size, price), toppingName, toppingPrice)
            else
                PepperoniPizza(size, price)
        }
        "sweetpotatopizza" -> {
            if (toppingPrice != 0)
                PepperoniPizzaWithTopping(PepperoniPizza(size, price), toppingName, toppingPrice)
            else
                PepperoniPizza(size, price)
        }
        else -> throw IllegalArgumentException("생성할 수 없습니다.")
    }

}