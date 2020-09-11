package com.example.mission3.model

class RealPrinterSubject : PrinterService { // RealSubject
    override fun printing(print: Print) {
        val cpu = CPU
        cpu.requestProcessing(print)
    }
}