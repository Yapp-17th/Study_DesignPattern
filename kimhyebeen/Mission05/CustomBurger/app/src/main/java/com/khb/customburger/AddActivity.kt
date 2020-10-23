package com.khb.customburger

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import androidx.databinding.DataBindingUtil
import com.khb.customburger.databinding.ActivityAddBinding

class AddActivity : AppCompatActivity() {
    private lateinit var binding: ActivityAddBinding
    private val viewModel = BurgerViewModel()

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_add)

        binding = DataBindingUtil.setContentView(this, R.layout.activity_add)
        binding.lifecycleOwner = this
        binding.setVariable(BR.burgerVM, viewModel)
    }
}