package com.khb.printersystem

class RealPrinter(
    var name: String,
    var proxy: PrinterSubject
) : PrinterSubject {
    var curPrint: String? = null
    var proxyForInterrupt: PrinterSubject? = null

    override fun setPrinterName(name: String) {
        this.name = name
    }

    override fun getPrinterName(): String {
        return this.name
    }

    override fun addPrintObject(str: String) {
        TODO("현재 프린트 해야할 출력물을 받아요")
        TODO("몇 초 뒤에 print()실행")

        print()
    }

    override fun print() {
        println(curPrint)

        TODO("proxy에게 출력 완료를 알려줘요.")
    }
}