package com.example.mission3

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import androidx.recyclerview.widget.GridLayoutManager
import com.example.mission3.adapter.PrintAdapter
import com.example.mission3.model.CPU
import com.example.mission3.model.CPU.cpu_work
import com.example.mission3.model.Client
import com.example.mission3.model.Print
import com.example.mission3.model.PrinterSpooler
import kotlinx.android.synthetic.main.activity_main.*
import kotlinx.coroutines.*

class MainActivity : AppCompatActivity()
{
    lateinit var client: Client

    val printDatas = ArrayList<Print>()
    val pAdapter = PrintAdapter(this, printDatas)

    val cpu = CPU

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)


        val printerSpooler = PrinterSpooler
        val newContext = newSingleThreadContext("newContext")

        print.adapter = pAdapter
        print.layoutManager = GridLayoutManager(this, 3)
        print.setHasFixedSize(true)

        var index: Int = 0
        client = Client(0)
        var print: Print

        file1.setOnClickListener {
            print = Print(index++, false, file1.text.toString(), 2000L)
            addItem(print)
            GlobalScope.launch(Dispatchers.Main) {
                val i = print.index
                withContext(newContext) {
                    client.printRequest(print)
                }
                 updateItem(i)
            }
        }

        file2.setOnClickListener {
            print = Print(index++, false, file2.text.toString(), 3000L)
            addItem(print)
            GlobalScope.launch(Dispatchers.Main) {
                val i = print.index
                withContext(newContext) {
                    client.printRequest(print)
                }
                updateItem(i)
            }
        }

        file3.setOnClickListener {
            print = Print(index++, false, file3.text.toString(), 4000L)
            addItem(print)
            GlobalScope.launch(Dispatchers.Main) {
                val i = print.index
                withContext(newContext) {
                    client.printRequest(print)
                }
                updateItem(i)
            }
        }
   }

    fun addItem(print: Print){
        printDatas.add(print)
        pAdapter.notifyDataSetChanged()
    }

    fun updateItem(i: Int){
        printDatas[i].status = true
        pAdapter.notifyDataSetChanged()
    }
}