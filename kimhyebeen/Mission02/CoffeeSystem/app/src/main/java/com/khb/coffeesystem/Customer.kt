package com.khb.coffeesystem

import com.khb.coffeesystem.model.Coffee

class Customer(name: String) {
    val name = name

    fun order(coffeeName: String) {
        println("customer($name): $coffeeName 을 주문했습니다.")
        Menu.choose(coffeeName)?.let { menu -> Cashier.receiveOrder(this, menu) }
    }

    fun receiveAlarm(name: String, coffee: Coffee) {
        if (this.name != name) println("customer(${this.name}): 내 껀 언제나와ㅠ")
        else {
            println("customer(${this.name}): 내꺼다!!")
            // view에서 customer 삭
        }
    }
}