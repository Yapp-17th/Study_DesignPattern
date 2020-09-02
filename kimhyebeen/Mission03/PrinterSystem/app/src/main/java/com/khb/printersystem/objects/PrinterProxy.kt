package com.khb.printersystem.objects

import java.util.*

class PrinterProxy(
    var name: String
) : PrinterSubject {
    private var printQueue: Queue<String> = LinkedList()
    private var printer: PrinterSubject = RealPrinter(name, this)

    override fun setPrinterName(name: String) {
        this.name = name
        printer.setPrinterName(name)
    }

    override fun getPrinterName(): String {
        return printer.getPrinterName()
    }

    override fun addPrintObject(str: String) {
        this.printQueue.add(str)
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