package com.khb.dictionary.model

import retrofit2.Retrofit
import retrofit2.converter.gson.GsonConverterFactory

object NetworkModule {
    private var retrofit: Retrofit = Retrofit.Builder()
        .baseUrl("https://openapi.naver.com/v1/")
        .addConverterFactory(GsonConverterFactory.create())
        .build()

    val searchApi = retrofit.create(SearchApi::class.java)
}