package com.khb.printersystem.objects

import kotlinx.coroutines.delay
import kotlinx.coroutines.runBlocking

class RealPrinter(
    var name: String,
    var proxy: PrinterSubject
) : PrinterSubject {
    private var isAvailable: Boolean = true
    private var curPrint: String? = null

    override fun setPrinterName(name: String) {
        this.name = name
    }

    override fun getPrinterName(): String {
        return this.name
    }

    override fun addPrintObject(str: String) {
        curPrint = str
        runBlocking {
            delay(3000)
            print()
        }
    }

    override fun print() {
        println(curPrint)
        curPrint = null
        proxy.print()
        TODO("view에는 출력 완료 상태로 설정")
    }

    fun getIsAvailable(): Boolean {
        return this.isAvailable
    }
}