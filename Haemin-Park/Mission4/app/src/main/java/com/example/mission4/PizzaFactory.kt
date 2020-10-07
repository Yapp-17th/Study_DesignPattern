package com.example.mission4

import com.example.mission4.model.PepperoniPizza
import com.example.mission4.model.Pizza
import com.example.mission4.model.PotatoPizza
import com.example.mission4.model.SweetPotatoPizza

class PizzaFactory {

    fun createPizza(name: String, size: String, price: Int, topping: ArrayList<String>) = when(name){
        "페퍼로니 피자" -> PepperoniPizza(size, price, topping)
        "포테이토 피자" -> PotatoPizza(size, price, topping)
        "고구마 피자" -> SweetPotatoPizza(size, price, topping)
        else -> throw IllegalArgumentException("생성할 수 없습니다.")
    }

}