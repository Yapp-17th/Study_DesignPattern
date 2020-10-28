package com.khb.customburger.activity

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import androidx.lifecycle.ViewModelProvider
import com.khb.customburger.R
import com.khb.customburger.viewmodel.BurgerVMFactory
import com.khb.customburger.viewmodel.BurgerViewModel

class MainActivity : AppCompatActivity() {
    private lateinit var viewModel: BurgerViewModel

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        viewModel = ViewModelProvider(this, BurgerVMFactory())
                .get(BurgerViewModel::class.java)

        val cabbage = getMaterial("cabbage")
        val cheese = getMaterial("cheese")
        val shrimp = getMaterial("shrimp")
        val tomato = getMaterial("tomato")
        val patty1 = getMaterial("patty01")
        val patty2 = getMaterial("patty02")
    }

    private fun getMaterial(str: String): Boolean {
        return intent.getBooleanExtra(str, false)
    }
}