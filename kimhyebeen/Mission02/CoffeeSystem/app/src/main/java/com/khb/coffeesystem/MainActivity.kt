package com.khb.coffeesystem

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import com.khb.coffeesystem.model.Coffee
import com.khb.coffeesystem.model.MenuItem
import kotlinx.coroutines.GlobalScope
import kotlinx.coroutines.delay
import kotlinx.coroutines.launch

class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        val customer1 = Customer("Tommy")
        val customer2 = Customer("Anna")
        val customer3 = Customer("Harry")

        GlobalScope.launch {
            launch { customer1.order("mocha") }
            launch {
                delay(500)
                customer2.order("americano")
            }
            launch {
                delay(1000)
                customer3.order("americano")
            }
        }
    }
}