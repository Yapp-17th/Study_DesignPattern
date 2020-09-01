package com.khb.printersystem.objects

interface PrinterSubject {
    fun setPrinterName(name: String)
    fun getPrinterName(): String
    fun addPrintObject(str: String)
    fun print()
}