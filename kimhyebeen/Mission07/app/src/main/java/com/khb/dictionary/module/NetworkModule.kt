package com.khb.dictionary.module

import com.khb.dictionary.model.SearchApi
import okhttp3.OkHttpClient
import org.koin.dsl.module
import retrofit2.Converter
import retrofit2.Retrofit
import retrofit2.converter.gson.GsonConverterFactory

val networkModule = module {
    single {
        GsonConverterFactory.create() as Converter.Factory
    }

    single {
        Retrofit.Builder()
            .client(OkHttpClient.Builder().build())
            .baseUrl("https://openapi.naver.com/v1/")
            .addConverterFactory(get())
            .build()
    }
}

val apiModule = module {
    single(createdAtStart = false) {
        get<Retrofit>().create(SearchApi::class.java)
    }
}