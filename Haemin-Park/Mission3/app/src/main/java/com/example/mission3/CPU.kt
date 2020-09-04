package com.example.mission3

import android.util.Log

object CPU{

    init {
        Log.d("CPU", "초기화~~")
    }

    fun requestProcessing(fileNm: String){
        Log.d("CPU", fileNm + " 출력 완료~~")
    }
}