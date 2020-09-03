package com.khb.printersystem.objects

import com.khb.printersystem.item.PrintItem
import kotlinx.coroutines.delay
import kotlinx.coroutines.runBlocking

class RealPrinter(
    var name: String,
    var proxy: PrinterSubject
) : PrinterSubject {
    override var isAvailable: Boolean = true
    private var curPrint: PrintItem? = null

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
//        TODO("view에는 출력 중 상태로 설정")
            println("출력 중")

            delay(5000L)

            curPrint?.let { print() }
        }
    }

    override fun print() {
//        TODO("view에는 출력 완료 상태로 설정")
        println("출력 완료 : \"${curPrint?.contents}\"")

        curPrint = null
        isAvailable = true

        proxy.print()

    }
}