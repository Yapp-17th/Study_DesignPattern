package com.example.mission3

import android.util.Log

object PrinterSpooler : PrinterService{ // Proxy: 실제 객체 생성 제어

    private lateinit var realPrinterSubject: PrinterService

    init {
        Log.d("PrinterSpooler", "초기화~~")
    }

    override fun printing(fileNm: String) {
        realPrinterSubject = RealPrinterSubject() // RealSubject 생성
        realPrinterSubject.printing(fileNm)
    }
}