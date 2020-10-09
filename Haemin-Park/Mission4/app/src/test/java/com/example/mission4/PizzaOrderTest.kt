package com.example.mission4

import com.example.mission4.model.OrderData
import com.example.mission4.model.PepperoniPizza
import com.example.mission4.model.Pizza
import com.example.mission4.model.PotatoPizza
import junit.framework.Assert.assertEquals
import junit.framework.Assert.assertNotNull
import org.junit.Before
import org.junit.Test

class PizzaOrderTest {

    private val pizzaFactory = PizzaFactory()
    private lateinit var orderPizza: Pizza
    private val orderData = OrderData

    @Before
    fun orderPotatoPizza(){
        orderPizza = pizzaFactory.createPizza("포테이토 피자", "small", 15900, ArrayList())
        assertEquals(15900, orderPizza.price)
    }

    @Test
    fun orderIsNotNull(){
        assertNotNull(orderPizza)
    }
}