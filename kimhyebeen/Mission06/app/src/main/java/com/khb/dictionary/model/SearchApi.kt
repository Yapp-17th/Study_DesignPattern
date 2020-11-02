package com.khb.dictionary.model

import com.khb.dictionary.SecretKeySet
import retrofit2.Call
import retrofit2.http.GET
import retrofit2.http.Headers
import retrofit2.http.Query

interface SearchApi {
    @Headers(
        "X-Naver-Client-Id: ${SecretKeySet.clientId}",
        "X-Naver-Client-Secret: ${SecretKeySet.clientSecret}"
    )
    @GET("search/encyc.json")
    fun getSearchList(
        @Query("query") query: String
    ): Call<SearchItem>
}