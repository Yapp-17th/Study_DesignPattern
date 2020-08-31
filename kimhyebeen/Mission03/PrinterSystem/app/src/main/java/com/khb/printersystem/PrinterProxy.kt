package com.khb.printersystem

import java.util.*

class PrinterProxy(
    var name: String
) : PrinterSubject {
    private var PrintQueue: Queue<String> = LinkedList()
    private var printer: PrinterSubject? = null

    init {
        initPrinter(this.name)
    }

    override fun setPrinterName(name: String) {
        TODO("Real printer 이름도 재설정")
        this.name = name
    }

    override fun getPrinterName(): String {
        printer?.let { return it.getPrinterName() }

        initPrinter(this.name)
        return printer!!.getPrinterName()
    }

    override fun addPrintObject(str: String) {
        TODO("프록시에게 순차적으로 전달해 줄 출력 내용물을 큐에 저장")
        TODO("view에는 대기중 상태로 설정")
    }

    override fun print() {
        TODO("Printer에게 요청해요.")
        TODO("view에는 출력중 상태로 설정")
    }

    fun initPrinter(name: String) {
        TODO("RealPrinter 인스턴스 생성")
    }

    fun update() {
        TODO("view에는 출력완료 상태로 설정")
        print()
    }
}