package com.khb.dictionary.model

import com.google.gson.annotations.SerializedName

class SearchItem {
    @SerializedName("items")
    var items: List<DictionaryItem>? = null
}