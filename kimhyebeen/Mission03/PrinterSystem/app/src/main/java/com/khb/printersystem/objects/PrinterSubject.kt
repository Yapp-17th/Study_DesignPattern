package com.khb.printersystem.objects

import com.khb.printersystem.item.PrintItem

interface PrinterSubject {
    var isAvailable: Boolean
    fun setPrinterName(name: String)
    fun getPrinterName(): String
    fun getAvailable(): Boolean
    fun addPrintObject(item: PrintItem)
    fun print()
}