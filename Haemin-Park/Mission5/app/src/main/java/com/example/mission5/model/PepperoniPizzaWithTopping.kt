package com.example.mission5.model

class PepperoniPizzaWithTopping(private val pepperoniPizza: PepperoniPizza, toppingName: String, toppingPrice: Int): PizzaDecorator() {
    override val type: String
        get() = "페퍼로니 피자 With " + toppingName
    override val toppingName = toppingName
    override val toppingPrice = toppingPrice
    override val name: String
        get() = pepperoniPizza.toppingName
    override val price: Int
        get() = pepperoniPizza.totalPrice
    override val size: String
        get() = pepperoniPizza.size
}