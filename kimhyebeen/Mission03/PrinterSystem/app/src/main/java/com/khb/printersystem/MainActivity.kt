package com.khb.printersystem

import android.annotation.SuppressLint
import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import com.khb.printersystem.item.PrintItem
import com.khb.printersystem.objects.PrinterProxy
import kotlinx.android.synthetic.main.activity_main.*
import kotlinx.coroutines.GlobalScope
import kotlinx.coroutines.launch
import java.text.SimpleDateFormat

class MainActivity : AppCompatActivity() {
    @SuppressLint("SimpleDateFormat")
    private val sdf = SimpleDateFormat("HH:mm:ss")
    private var printerProxy = PrinterProxy("프린터1")

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)


        printButton.setOnClickListener {
            if (editText.text.toString() != "") {
                val str = editText.text.toString()
                editText.setText("")

                GlobalScope.launch { requestPrint(str) }
            }
        }

        statusButton.setOnClickListener {
            startActivity(Intent(this, StatusActivity::class.java))
        }
    }
    private fun requestPrint(str: String) {
        val curTime = sdf.format(System.currentTimeMillis())
        PrintItem(
            curTime,
            str,
            "대기 중",
            true
        ).let {
            ShowManager.addStatusItem(it)
            printerProxy.addPrintObject(it)
        }
    }
}