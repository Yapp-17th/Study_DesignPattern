package com.khb.dictionary.model

import com.google.gson.annotations.SerializedName

class DictionaryItem {
    @SerializedName("title")
    var title: String? = null
    @SerializedName("link")
    var link: String? = null
    @SerializedName("description")
    var description: String? = null
}