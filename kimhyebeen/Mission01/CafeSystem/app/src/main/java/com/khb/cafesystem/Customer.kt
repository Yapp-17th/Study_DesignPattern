package com.khb.cafesystem

import com.khb.cafesystem.items.Coffee

class Customer(customerName: String, addProcessText: (String) -> Unit) {
    private var customerName = customerName
    private val menu = Menu
    private val addProcessText = addProcessText
    private val barista = Barista

    fun order(menuName: String): Coffee? {
        menu.choose(menuName, addProcessText)?.let {
            addProcessText("customer : 손님은 메뉴판으로부터 ${menuName}이라는 커피객체(이름, 가격)을 받아 바리스타에게 알려줍니다.\n")
            return barista.makeCoffee(it, addProcessText)
        } ?: return null
    }

    fun giveMoney(money: Int) {
        addProcessText("customer : 손님이 바리스타에게 돈을 줬습니다.\n")
        barista.recieveMoney(money, addProcessText);
    }
}