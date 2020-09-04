package com.example.mission3

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle

class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        val cpu = CPU
        val printerSpooler = PrinterSpooler

        var client = Client(1,"생갈치1호의행방불명.pdf")
        client.printRequest()

        client = Client(2,"명란젓코난.pdf")
        client.printRequest()
   }
}