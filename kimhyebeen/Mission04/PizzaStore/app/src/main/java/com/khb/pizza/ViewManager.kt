package com.khb.pizza

import com.khb.pizza.pizza.Pizza

object ViewManager {
    lateinit var settingView: (pizza: Pizza) -> Unit
    lateinit var settingStatus: (str: String) -> Unit
}