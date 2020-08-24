package com.example.mission2

class Customer(val num: Int, val cashier: Cashier) {

    fun order(menu: Menu, menuName: String, barista: Barista){

        var menuItem: MenuItem? = menu.choose(menuName)

        if(menuItem != null) {
           cashier.pickMenu(menuItem)
        }

    }
}