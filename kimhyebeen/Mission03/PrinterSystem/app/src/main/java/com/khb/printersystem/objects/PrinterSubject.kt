package com.khb.printersystem.objects

import com.khb.printersystem.item.PrintItem

interface PrinterSubject {
    fun setPrinterName(name: String)
    fun getPrinterName(): String
    fun addPrintObject(item: PrintItem)
    fun print()
}