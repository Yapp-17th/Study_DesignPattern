package com.example.mission2

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.view.View
import androidx.recyclerview.widget.GridLayoutManager
import com.example.mission2.adapter.OrderAdapter
import com.example.mission2.model.*
import kotlinx.android.synthetic.main.activity_main.*

class MainActivity : AppCompatActivity(), ViewCallBack {

    lateinit var orderDatas: ArrayList<OrderData>
    lateinit var mAdapter : OrderAdapter

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

    }

    override fun onStart() {
        super.onStart()

        mtext.visibility = View.INVISIBLE
        obtn.visibility = View.INVISIBLE

        orderDatas = ArrayList<OrderData>()
        mAdapter = OrderAdapter(this, orderDatas)
        recycler.adapter = mAdapter
        recycler.layoutManager = GridLayoutManager(this, 4)
        recycler.setHasFixedSize(true)

        val menu: Menu = Menu // 오브젝트
        val cashier: Cashier = Cashier() // 캐셔와 바리스타도 한명씩
        val orderList: OrderList = OrderList(this, cashier)
        val barista: Barista = Barista(this, cashier)

        lateinit var customer: Customer

        var num = 0

        cbtn.setOnClickListener {
            mtext.visibility = View.VISIBLE
            obtn.visibility = View.VISIBLE
            mtext.text = null
            num++
            cnum.text = num.toString()
            customer = Customer(this, num, cashier)

        }

        obtn.setOnClickListener {
            customer.order(menu, mtext.text.toString(), barista)
            mtext.setText("")
        }

    }

    override fun updateCustomer(str: String) {
        c.text = c.text.toString() + "\n" + str
    }

    override fun updateOrderList(re: Boolean, orderData: OrderData) {

        when(re){
            true -> orderDatas[orderData.index-1] = orderData // 0부터 시작하므로 -1
            else -> orderDatas.add(orderData)
        }

        mAdapter.notifyDataSetChanged()
    }

    override fun updateBarista(str: String) {
        b.text=b.text.toString() +"\n"+ str
    }

    override fun updateWaitTime(time: Long) {
        wtime.text = "총 대기시간: ${time.toString()}"
    }
}
