package com.example.mission5.view

import android.annotation.SuppressLint
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.TextView
import android.widget.Toast
import androidx.appcompat.app.AlertDialog
import androidx.recyclerview.widget.LinearLayoutManager
import com.example.mission5.R
import com.example.mission5.adapter.OrderAdapter
import com.example.mission5.model.OrderData
import kotlinx.android.synthetic.main.activity_basket.*

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