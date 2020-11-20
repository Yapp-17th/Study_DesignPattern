package com.khb.dictionary.viewmodel

import android.view.View
import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel
import com.khb.dictionary.model.DictionaryItem
import com.khb.dictionary.model.SearchRepository

class DictionaryViewModel: ViewModel() {
    private val searchRepository = SearchRepository()

    val searchList: LiveData<List<DictionaryItem>> = searchRepository.searchList
    var editText = MutableLiveData<String>()

    init {
        editText.value = ""
    }

    fun clickSearchButton(view: View) {
        searchRepository.requestDictionary(editText.value ?: "")
    }
}