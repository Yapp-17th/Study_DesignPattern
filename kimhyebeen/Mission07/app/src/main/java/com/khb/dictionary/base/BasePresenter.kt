package com.khb.dictionary.base

interface BasePresenter<T> {
    fun takeView(view: T)
    fun dropView()
}