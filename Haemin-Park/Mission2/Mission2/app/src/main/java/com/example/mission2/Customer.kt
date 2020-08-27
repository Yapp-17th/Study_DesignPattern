package com.example.mission2

class Customer(vCallBack: ViewCallBack, val num: Int, val cashier: Cashier) {

    private val vCallBack: ViewCallBack = vCallBack

    fun order(menu: Menu, menuName: String, barista: Barista){

        var menuItem: MenuItem? = menu.choose(menuName)

        if(menuItem != null) {
           cashier.pickMenu(num, menuItem)
           vCallBack.updateCustomer("손님 ${num}: ${menuName} 주문")
        }

    }
}