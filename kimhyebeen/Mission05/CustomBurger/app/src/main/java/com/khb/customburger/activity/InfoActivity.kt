package com.khb.customburger.activity

import android.annotation.SuppressLint
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import androidx.databinding.DataBindingUtil
import androidx.lifecycle.ViewModelProvider
import com.khb.customburger.BR
import com.khb.customburger.R
import com.khb.customburger.databinding.ActivityInfoBinding
import com.khb.customburger.viewmodel.BurgerVMFactory
import com.khb.customburger.viewmodel.BurgerViewModel

class InfoActivity : AppCompatActivity() {
    private lateinit var binding: ActivityInfoBinding
    private lateinit var viewModel: BurgerViewModel
    private val strList = listOf("cabbage", "cheese", "shrimp", "tomato", "patty01", "patty02")

    @SuppressLint("SetTextI18n")
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_info)

        viewModel = ViewModelProvider(this, BurgerVMFactory())
                .get(BurgerViewModel::class.java)
        initBinding()

        val list = ArrayList<String>()
        strList.map {
            if (getMaterial(it)) list.add(it)
        }

        val burger = viewModel.getDecoBurger(list.toList())
        binding.burgerTextView.text = "버거 완성!! (맛: ${burger.taste()}점)"
        binding.itemTextView.text = "${burger.decorate()}"
    }

    private fun initBinding() {
        binding = DataBindingUtil.setContentView(this, R.layout.activity_info)
        binding.lifecycleOwner = this
        binding.setVariable(BR.burgerVM, viewModel)
        binding.setVariable(BR.main, this)
    }

    private fun getMaterial(str: String): Boolean {
        return intent.getBooleanExtra(str, false)
    }
}