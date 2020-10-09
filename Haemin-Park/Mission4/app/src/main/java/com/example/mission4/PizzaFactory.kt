package com.example.mission4

import com.example.mission4.model.PepperoniPizza
import com.example.mission4.model.Pizza
import com.example.mission4.model.PotatoPizza
import com.example.mission4.model.SweetPotatoPizza

class PizzaFactory {

    fun createPizza(name: String, size: String, totalPrice: Int, topping: ArrayList<String>) = when(name){
        "페퍼로니 피자" -> PepperoniPizza(size, totalPrice, topping)
        "포테이토 피자" -> PotatoPizza(size, totalPrice, topping)
        "고구마 피자" -> SweetPotatoPizza(size, totalPrice, topping)
        else -> throw IllegalArgumentException("생성할 수 없습니다.")
    }

}