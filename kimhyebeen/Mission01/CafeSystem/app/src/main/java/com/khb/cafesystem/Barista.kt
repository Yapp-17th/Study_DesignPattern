package com.khb.cafesystem

import com.khb.cafesystem.items.Coffee
import com.khb.cafesystem.items.MenuItem

object Barista {
    private var cash = 0;

    fun makeCoffee(
        menuItem: MenuItem,
        addProcessText: (String) -> Unit
    ): Coffee {
        addProcessText("barista : ${menuItem.getMenuName()}을 만들어 손님에게 건냅니다.\n")
        return Coffee(menuItem)
    }

    fun recieveMoney(money: Int, addProcessText: (String) -> Unit) {
        addProcessText("barista : ${money}원을 받았습니다.\n")
        cash += money
    }
}