package com.khb.dictionary.base

import com.khb.dictionary.model.DictionaryItem

interface MainContract {
    interface View: BaseView {
        fun setAdapter()
        fun setButton()
        fun showDictionaryList(list: List<DictionaryItem>)
    }
    interface Presenter: BasePresenter<View> {
        fun getDictionaryData(keyword: String)
    }
}