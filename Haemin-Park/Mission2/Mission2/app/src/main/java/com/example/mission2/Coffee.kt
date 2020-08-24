package com.example.mission2

class Coffee(menuItem: MenuItem) {

    private var name: String
    private var price: Int

    init {

        this.name = menuItem.getName()
        this.price = menuItem.cost()
    }

}