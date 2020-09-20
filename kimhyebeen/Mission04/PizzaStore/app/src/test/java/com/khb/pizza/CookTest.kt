package com.khb.pizza

import com.khb.pizza.model.OrderSheet
import kotlinx.coroutines.delay
import kotlinx.coroutines.runBlocking
import org.junit.jupiter.api.Test

import org.junit.jupiter.api.Assertions.*
import org.junit.jupiter.api.DisplayName
import org.mockito.Mock
import org.mockito.Mockito

internal class CookTest {
    val user = User("Jamie", "서울", "010-2020-3030")
    @Mock
    val orderSheet = OrderSheet(user, "potato", 500, "original", 'M', arrayListOf("pineapple"))

    @Test
    @DisplayName("Cook가 일하고 있는지 제대로 확인되는지")
    fun getStatus() {
        val exCook = Mockito.mock(Cook::class.java)
        val beforeStatus = exCook.getStatus()
        exCook.orderPizza(orderSheet)
        val startStatus = exCook.getStatus()
        runBlocking {
            delay(1000)
        }
        val finishStatus = Cook.getStatus()

        assertNotNull(Cook)
        assertTrue(beforeStatus)
        assertTrue(!startStatus)
        assertTrue(beforeStatus == finishStatus)
    }

    @Test
    @DisplayName("PizzaFactory에 요청하고 Pizza를 받아요")
    fun orderPizza() {
        assertTrue(Cook.getStatus())

        val pizza = Cook.orderPizza(orderSheet)

        assertNotNull(pizza)
        assertTrue(pizza.price == 11500)
    }
}