package com.khb.dictionary.main

import android.util.Log
import com.khb.dictionary.base.MainContract
import com.khb.dictionary.model.SearchApi
import com.khb.dictionary.model.SearchItem
import retrofit2.Call
import retrofit2.Callback
import retrofit2.Response

class MainPresenter(
    private val searchApi: SearchApi
): MainContract.Presenter {
    private var view: MainContract.View? = null

    override fun getDictionaryData(keyword: String) {
        searchApi.getSearchList(keyword)
            .enqueue(object : Callback<SearchItem> {
                override fun onFailure(call: Call<SearchItem>, t: Throwable) {
                    Log.e("MainPresenter", t.message ?: "error")
                    view?.showError("데이터 요청 실패")
                }
                override fun onResponse(call: Call<SearchItem>, response: Response<SearchItem>) {
                    response.body()?.items?.let { view?.showDictionaryList(it) }
                }
            })
    }

    override fun takeView(view: MainContract.View) {
        this.view = view
    }

    override fun dropView() {
        this.view = null
    }
}