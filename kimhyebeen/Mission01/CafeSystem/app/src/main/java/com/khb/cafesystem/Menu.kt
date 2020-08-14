package com.khb.cafesystem

import com.khb.cafesystem.items.MenuItem

object Menu {
    private var items: HashMap<String, MenuItem>? = null

    init {
        this.items = hashMapOf(
            "americano" to MenuItem("Americano", 1500),
            "cappuccino" to MenuItem("Cappuccino", 2000),
            "latte" to MenuItem("Latte", 2500),
            "esspresso" to MenuItem("Esspresso", 2500),
            "mocha" to MenuItem("Mocha", 3000)
        )
    }

    fun addMenu(vararg items : MenuItem) {
        items.map { this.items?.put(it.getMenuName(), it) }
    }

    fun choose(menuName: String): MenuItem? {
        return this.items?.get(menuName.toLowerCase())
    }

    fun getAllMenu(): HashMap<String, MenuItem>? {
        return this.items
    }
}