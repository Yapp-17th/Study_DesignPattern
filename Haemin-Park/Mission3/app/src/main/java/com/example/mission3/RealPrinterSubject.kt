package com.example.mission3

class RealPrinterSubject : PrinterService{ // RealSubject
    override fun printing(fileNm: String) {
        val cpu = CPU
        cpu.requestProcessing(fileNm)
    }
}