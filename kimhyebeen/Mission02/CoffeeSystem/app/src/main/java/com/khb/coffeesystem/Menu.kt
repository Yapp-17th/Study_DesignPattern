package com.khb.coffeesystem

import com.khb.coffeesystem.model.MenuItem

object Menu {
    var menuList = hashMapOf(
        "americano" to MenuItem("Americano", 1500, 1500),
        "latte" to MenuItem("Latte", 2000, 3500),
        "mocha" to MenuItem("Mocha", 2500, 6000)
    )

    fun choose(coffeeName: String): MenuItem? {
        return menuList[coffeeName]
    }
}