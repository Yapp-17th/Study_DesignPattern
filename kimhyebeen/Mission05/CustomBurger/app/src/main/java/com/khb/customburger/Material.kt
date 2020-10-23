package com.khb.customburger

import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData

data class Material(
        val name: String,
        val taste: Int,
        var selected: MutableLiveData<Boolean> = MutableLiveData<Boolean>()
) {
        init {
            selected.value = false
        }

        fun changeSelected() {
                selected.value = selected.value?.let { !it }
        }
}