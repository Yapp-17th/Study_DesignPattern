package com.example.mission3.model

import android.util.Log
import java.util.*

object PrinterSpooler : PrinterService { // Proxy: 실제 객체 생성 제어

    private lateinit var realPrinterSubject: PrinterService
    private var work: Queue<Print> = LinkedList()

    init {
        Log.d("PrinterSpooler", "초기화~~")
    }

    override fun printing(print: Print) {
        work.add(print)

        realPrinterSubject = RealPrinterSubject() // RealSubject 생성
        realPrinterSubject.printing(work.poll())

    }
}