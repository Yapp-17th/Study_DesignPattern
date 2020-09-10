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
        print.layoutManager = GridLayoutManager(this, 4)
        print.setHasFixedSize(true)

        client = Client(0)
        var print: Print

        file1.setOnClickListener {
            print = Print(file1.text.toString(), 2000L)
            addItem(print)
            GlobalScope.launch(Dispatchers.Main) {
                withContext(newContext) {
                    client.printRequest(print)
                }
                 printDatas.removeAt(0)
                 pAdapter.notifyDataSetChanged()
            }
        }

        file2.setOnClickListener {
            print = Print(file2.text.toString(), 3000L)
            addItem(print)
            GlobalScope.launch(Dispatchers.Main) {
                withContext(newContext) {
                    client.printRequest(print)
                }
                printDatas.removeAt(0)
                pAdapter.notifyDataSetChanged()
            }
        }

        file3.setOnClickListener {
            print = Print(file3.text.toString(), 4000L)
            addItem(print)
            GlobalScope.launch(Dispatchers.Main) {
                withContext(newContext) {
                    client.printRequest(print)
                }
                printDatas.removeAt(0)
                pAdapter.notifyDataSetChanged()
            }
        }
   }

    fun addItem(print: Print){
        printDatas.add(print)
        pAdapter.notifyDataSetChanged()
    }
}