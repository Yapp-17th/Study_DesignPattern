package com.khb.customburger.util

import android.graphics.Color
import android.view.View
import androidx.databinding.BindingAdapter

@BindingAdapter("checkSelected")
fun View.checkSelected(value: Boolean) {
    println("클릭 : $value")
    if (value) this.setBackgroundColor(Color.parseColor("#B2C9F6"))
    else this.setBackgroundColor(Color.parseColor("#ffffff"))
}