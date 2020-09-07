package com.example.mission3

class Client(num: Int) {

    private val printerSpooler = PrinterSpooler

    fun printRequest(printData: Print){
        printerSpooler.printing(printData.fileNm)
    }
}