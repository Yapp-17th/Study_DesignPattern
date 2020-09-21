package com.khb.pizza.factory

import com.khb.pizza.StatusActivity
import com.khb.pizza.ViewManager
import com.khb.pizza.model.Menu
import com.khb.pizza.pizza.*
import kotlinx.coroutines.*

class PizzaFactory {
    private lateinit var pizza: Pizza
    private val waitList = listOf("준비중", "준비중.", "준비중..")
    private val bakeList = listOf("오븐에 굽는중", "오븐에 굽는중.", "오븐에 굽는중..")
    private val boxList = listOf("포장중", "포장중.", "포장중..")

    fun orderPizza(menu: Menu) {
        pizza = when(menu.name) {
            "치즈 피자" -> CheesePizza(arrayListOf("모짜렐라"), 8000, "오리지널",
                arrayListOf("올리브", "파프리카"), 'M')
            "페페로니 피자" -> PepperoniPizza(arrayListOf("모짜렐라"), 10000, "오리지널",
                arrayListOf("페페로니", "올리브", "파프리카"), 'M')
            "포테이토 피자" -> PotatoPizza(arrayListOf("모짜렐라"), 12000, "오리지널",
                arrayListOf("페페로니", "올리브", "파프리카", "포테이토"), 'M')
            "핫치킨 피자" -> HotChickenPizza(arrayListOf("모짜렐라", "체다"), 18000, "오리지널",
                arrayListOf("페페로니", "올리브", "파프리카", "핫치킨"), 'M')
            "슈림프 피자" -> ShrimpPizza(arrayListOf("모짜렐라", "체다"), 20000, "오리지널",
                arrayListOf("페페로니", "올리브", "파프리카", "슈림프"), 'M')
            else -> SteakPizza(arrayListOf("모짜렐라", "체다"), 24000, "오리지널",
                arrayListOf("페페로니", "올리브", "파프리카", "스테이크", "파인애플"), 'M')
        }
        GlobalScope.launch(Dispatchers.Main) { prepare() }
    }
    private fun prepare() {
        GlobalScope.launch {
            for (i in 0..3) {
                println(waitList[i%3])
                ViewManager.settingStatus(waitList[i%3])
                delay(500)
            }
            baking()
        }
    }
    private fun baking() {
        runBlocking {
            for (i in 0..8) {
                ViewManager.settingStatus(bakeList[i%3])
                delay(500)
            }
        }
        boxing()
    }
    private fun boxing() {
        runBlocking {
            for (i in 0..5) {
                ViewManager.settingStatus(boxList[i%3])
                delay(500)
            }
        }
        getPizza()
    }
    private fun getPizza() {
        ViewManager.settingStatus("피자 완성!!")
        StatusActivity.receivePizza(pizza)
    }
}