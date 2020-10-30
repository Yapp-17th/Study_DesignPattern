package com.example.mission5.model

abstract class PizzaDecorator : Pizza() {
    /*
    피자 클래스를 상속할 때 추상 메소드가 아닌 메소드를 필요에 의해 추상메소드로 만들 수 있음
    */
    abstract override val toppingName: String
    abstract override val toppingPrice: Int
}