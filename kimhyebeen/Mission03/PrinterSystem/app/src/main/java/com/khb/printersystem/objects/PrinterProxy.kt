package com.khb.printersystem.objects

import com.khb.printersystem.ShowManager
import com.khb.printersystem.item.PrintItem
import java.util.*

class PrinterProxy(
    private var name: String
) : PrinterSubject {
    private var printQueue: Queue<PrintItem> = LinkedList()
    private var printer: RealPrinter = RealPrinter(name, this)

    override fun setPrinterName(name: String) {
        this.name = name
        printer.setPrinterName(name)
    }

    override fun getPrinterName(): String {
        return printer.getPrinterName()
    }

    override fun addPrintObject(item: PrintItem) {
        this.printQueue.add(item)
        ShowManager.changeItemStatus(item, "대기 중")

        if (!printer.getAvailable()) return
        print()

    }

    override fun print() {
        printQueue.poll()?.let { printer.addPrintObject(it) }
    }
}