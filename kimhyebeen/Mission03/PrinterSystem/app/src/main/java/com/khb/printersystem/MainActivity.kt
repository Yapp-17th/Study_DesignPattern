package com.khb.printersystem

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import com.khb.printersystem.item.StatusItem
import kotlinx.android.synthetic.main.activity_main.*

class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        printButton.setOnClickListener {
            TODO("text 내용을 proxy에 출력 요청 -> StatusItem 넘기기")
            editText.text = null
        }

        statusButton.setOnClickListener {
            startActivity(Intent(this, StatusActivity::class.java))
        }
    }
}