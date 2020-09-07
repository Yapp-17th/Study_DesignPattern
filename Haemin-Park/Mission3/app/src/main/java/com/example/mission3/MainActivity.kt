package com.example.mission3

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.util.Log
import android.view.DragEvent
import android.view.MotionEvent
import android.view.View
import android.view.ViewGroup
import android.widget.Adapter
import android.widget.Button
import android.widget.GridLayout
import android.widget.LinearLayout
import androidx.recyclerview.widget.GridLayoutManager
import com.example.mission3.adapter.PrintAdapter
import kotlinx.android.synthetic.main.activity_main.*

class MainActivity : AppCompatActivity()
{
    lateinit var client: Client

    val printDatas = ArrayList<Print>()
    val pAdapter = PrintAdapter(this, printDatas)

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        val cpu = CPU
        val printerSpooler = PrinterSpooler

        print.adapter = pAdapter
        print.layoutManager = GridLayoutManager(this, 4)
        print.setHasFixedSize(true)

        client = Client(0)
        var print: Print

        file1.setOnClickListener {
            print = Print(file1.text.toString(), 25.4F)
            client.printRequest(print)
            addItem(print)
        }

        file2.setOnClickListener {
            print = Print(file2.text.toString(), 30.2F)
            client.printRequest(print)
            addItem(print)
        }

        file3.setOnClickListener {
            print = Print(file3.text.toString(), 40.2F)
            client.printRequest(print)
            addItem(print)
        }
   }

    fun addItem(print: Print){
        printDatas.add(print)
        pAdapter.notifyDataSetChanged()
    }
}