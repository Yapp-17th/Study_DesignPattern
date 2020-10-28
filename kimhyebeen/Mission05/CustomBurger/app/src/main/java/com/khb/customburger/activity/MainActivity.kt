package com.khb.customburger.activity

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import androidx.databinding.DataBindingUtil
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModelProvider
import com.khb.customburger.BR
import com.khb.customburger.Burger
import com.khb.customburger.R
import com.khb.customburger.databinding.ActivityMainBinding
import com.khb.customburger.viewmodel.BurgerVMFactory
import com.khb.customburger.viewmodel.BurgerViewModel
import com.khb.customburger.viewmodel.DecoRepository

class MainActivity : AppCompatActivity() {
    private lateinit var binding: ActivityMainBinding
    private lateinit var viewModel: BurgerViewModel
    private val strList = listOf("cabbage", "cheese", "shrimp", "tomato", "patty01", "patty02")

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        viewModel = ViewModelProvider(this, BurgerVMFactory())
                .get(BurgerViewModel::class.java)
        initBinding()

        val list = ArrayList<String>()
        strList.map {
            if (getMaterial(it)) list.add(it)
        }

        val burger = viewModel.getDecoBurger(list.toList())
    }

    private fun initBinding() {
        binding = DataBindingUtil.setContentView(this, R.layout.activity_main)
        binding.lifecycleOwner = this
        binding.setVariable(BR.burgerVM, viewModel)
        binding.setVariable(BR.main, this)
    }

    private fun getMaterial(str: String): Boolean {
        return intent.getBooleanExtra(str, false)
    }
}