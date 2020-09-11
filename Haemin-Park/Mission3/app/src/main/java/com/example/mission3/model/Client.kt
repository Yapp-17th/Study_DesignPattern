package com.example.mission3.model

class Client(num: Int) {

    private val printerSpooler = PrinterSpooler

    fun printRequest(printData: Print){
        PrinterSpooler.printing(printData)
    }
}