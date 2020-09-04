package com.example.mission3

class Client(num: Int, private val fileNm: String) {

    private val printerSpooler = PrinterSpooler

    fun printRequest(){
        printerSpooler.printing(fileNm)
    }
}