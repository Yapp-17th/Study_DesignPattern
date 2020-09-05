package com.khb.printersystem.objects

import com.khb.printersystem.ShowManager
import com.khb.printersystem.item.PrintItem
import kotlinx.coroutines.delay
import kotlinx.coroutines.runBlocking

class RealPrinter(
    private var name: String,
    private var proxy: PrinterSubject
) : PrinterSubject {
    override var isAvailable: Boolean = true
    private lateinit var curPrint: PrintItem

    override fun setPrinterName(name: String) {
        this.name = name
    }

    override fun getPrinterName(): String {
        return this.name
    }

    override fun getAvailable(): Boolean {
        return this.isAvailable
    }

    override fun addPrintObject(item: PrintItem) {
        runBlocking {
            isAvailable = false
            curPrint = item
            ShowManager.changeItemStatus(curPrint, "출력 중")

            delay(4000L)
            print()
        }
    }

    override fun print() {
        ShowManager.changeItemStatus(curPrint, "출력 완료")
        isAvailable = true
        proxy.print()
    }
}