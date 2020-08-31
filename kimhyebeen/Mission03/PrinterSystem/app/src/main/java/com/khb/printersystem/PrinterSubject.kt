package com.khb.printersystem

interface PrinterSubject {
    fun setPrinterName(name: String)
    fun getPrinterName(): String
    fun addPrintObject(str: String)
    fun print()
}