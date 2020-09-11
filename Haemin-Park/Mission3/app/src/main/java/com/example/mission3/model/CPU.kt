package com.example.mission3.model

import android.util.Log
import com.example.mission3.MainActivity
import kotlinx.coroutines.*
import java.util.*

object CPU{

    var cpu_work: Queue<Print> = LinkedList()
    private var status: Boolean = true
    private val newContext = newSingleThreadContext("newContext")

    init {
        Log.d("CPU", "초기화~~")
    }

    fun requestProcessing(print: Print){
        cpu_work.add(print)
        working()
    }

    fun working() = runBlocking(newContext){
        val job = GlobalScope.launch {
            Log.d("CPU", cpu_work.peek().fileNm + " 출력 준비중~~")
            withContext(newContext) {
                delay(cpu_work.peek().printTime)
            }
            Log.d("CPU", cpu_work.peek().fileNm + " 출력 완료~~")
            cpu_work.poll()

        }
        job.join()
    }

}