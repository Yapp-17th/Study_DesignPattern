package com.example.mission4.view

import android.annotation.SuppressLint
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.view.View
import android.widget.TextView
import android.widget.Toast
import androidx.appcompat.app.AlertDialog
import androidx.recyclerview.widget.LinearLayoutManager
import com.example.mission4.R
import com.example.mission4.adapter.OrderAdapter
import com.example.mission4.adapter.PizzaAdapter
import com.example.mission4.model.OrderData
import com.example.mission4.model.PizzaMenuItem
import kotlinx.android.synthetic.main.activity_basket.*
import kotlinx.android.synthetic.main.activity_main.*
import kotlinx.android.synthetic.main.custom_dialog.*

class BasketActivity : AppCompatActivity() {

    val orderData = OrderData

    @SuppressLint("ShowToast")
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_basket)

        val oAdapter = OrderAdapter(this, orderData.orderDataList())

        order.adapter = oAdapter
        order.layoutManager = LinearLayoutManager(this)
        order.setHasFixedSize(true)

        totalprice.text = "최종금액: ${orderData.totalOrderPrice()}"

        b_order.setOnClickListener {
            val builder = AlertDialog.Builder(this)
            val dialogView = layoutInflater.inflate(R.layout.custom_dialog, null)
            val dialogText = dialogView.findViewById<TextView>(R.id.dialog_text)
            dialogText.text = "최종금액 ${orderData.totalOrderPrice()}을 주문하시겠습니까?"
            builder.setView(dialogView)
                    .setPositiveButton("확인") { dialogInterface, i ->
                        when(orderData.totalOrderPrice()){
                            0 -> Toast.makeText(this@BasketActivity, "장바구니가 비었습니다.", Toast.LENGTH_SHORT).show()
                            else -> {
                                orderData.resetOrder()
                                Toast.makeText(this@BasketActivity, "주문이 완료되었습니다.", Toast.LENGTH_SHORT).show()
                            }
                        }
                       finish()
                    }
                    .setNegativeButton("취소") { dialogInterface, i ->

                    }
                    .show()
        }

    }
}