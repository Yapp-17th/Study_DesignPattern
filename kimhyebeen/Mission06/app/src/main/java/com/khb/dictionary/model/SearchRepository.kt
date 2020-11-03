package com.khb.dictionary.model

import android.util.Log
import androidx.lifecycle.MutableLiveData
import retrofit2.Call
import retrofit2.Callback
import retrofit2.Response
import retrofit2.Retrofit
import retrofit2.converter.gson.GsonConverterFactory

class SearchRepository {
    var searchList = MutableLiveData<List<DictionaryItem>>()

    private var retrofit: Retrofit = Retrofit.Builder()
        .baseUrl("https://openapi.naver.com/v1/")
        .addConverterFactory(GsonConverterFactory.create())
        .build()
    private var searchApi = retrofit.create(SearchApi::class.java)

    fun requestDictionary(keyword: String) {
        searchApi.getSearchList(keyword)
            .enqueue(object : Callback<SearchItem> {
                override fun onFailure(call: Call<SearchItem>, t: Throwable) {
                    Log.e("SearchRepository", t.message ?: "error")
                }
                override fun onResponse(call: Call<SearchItem>, response: Response<SearchItem>) {
                    response.body()?.items?.let { saveResult(it) }
                }
            })
    }

    private fun saveResult(items: List<DictionaryItem>) {
        searchList.value = items
    }
}