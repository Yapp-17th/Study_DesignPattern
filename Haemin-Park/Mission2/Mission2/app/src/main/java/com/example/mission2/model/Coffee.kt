package com.example.mission2.model

class Coffee(menuItem: MenuItem) {

    private var name: String
    private var price: Int

    init {

        this.name = menuItem.getName()
        this.price = menuItem.cost()
    }

}