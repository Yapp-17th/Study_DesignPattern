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
    private val printerProxy = PrinterProxy("My Printer")

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        printImage.setOnClickListener {
            getEditText()?.let {
                GlobalScope.launch { requestPrint(it) }
            }
        }

        statusImage.setOnClickListener {
            startActivity(Intent(this, StatusActivity::class.java))
        }
    }
    private fun getEditText(): String? {
        if (editText.text.toString() == "") return null
        val str = editText.text.toString()
        editText.setText("")
        return str
    }

    private fun requestPrint(str: String) {
        PrintItem(
            printerProxy.getPrinterName(),
            sdf.format(System.currentTimeMillis()),
            str,
            "대기 중",
            true
        ).let { item ->
            ShowManager.addStatusItem(item)
            printerProxy.addPrintObject(item)
        }
    }
}