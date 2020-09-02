package com.khb.printersystem.objects

import com.khb.printersystem.item.PrintItem
import java.util.*

class PrinterProxy(
    var name: String
) : PrinterSubject {
    private var printQueue: Queue<PrintItem> = LinkedList()
    private var printer: PrinterSubject = RealPrinter(name, this)
    override var isAvailable: Boolean = true

    override fun setPrinterName(name: String) {
        this.name = name
        printer.setPrinterName(name)
    }

    override fun getPrinterName(): String {
        return printer.getPrinterName()
    }

    override fun getAvailable(): Boolean {
        return this.isAvailable
    }

    override fun addPrintObject(item: PrintItem) {
        this.printQueue.add(item)

        if (!printer.getAvailable()) return
        print()
        TODO("view에는 대기중 상태로 설정")
    }

    override fun print() {
        printQueue.poll()?.let {
            printer.addPrintObject(it)
            TODO("view에는 출력중 상태로 설정")
        }
    }
}