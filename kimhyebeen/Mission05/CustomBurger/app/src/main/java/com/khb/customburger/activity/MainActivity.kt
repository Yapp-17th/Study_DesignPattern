package com.khb.customburger.activity

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import com.khb.customburger.R

class MainActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        val cabbage = intent.getBooleanExtra("cabbage", false)
        println("cabbage는 $cabbage")
        // TODO("intent로 boolean값 받아오기")
    }
}