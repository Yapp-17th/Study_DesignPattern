package com.khb.coffeesystem

import com.khb.coffeesystem.model.MenuItem

class Menu {
    var menuList = hashMapOf(
        "americano" to MenuItem("Americano", 1500, 2000),
        "latte" to MenuItem("Latte", 2000, 3000),
        "Mocha" to MenuItem("Mocha", 2500, 4000)
    )

    fun choose(coffeeName: String): MenuItem? {
        return menuList[coffeeName]
    }
}