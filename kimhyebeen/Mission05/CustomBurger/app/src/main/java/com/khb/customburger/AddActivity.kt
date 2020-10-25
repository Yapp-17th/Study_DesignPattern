package com.khb.customburger

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.view.View
import androidx.databinding.DataBindingUtil
import androidx.lifecycle.ViewModelProvider
import com.khb.customburger.databinding.ActivityAddBinding
import com.khb.customburger.viewmodel.BurgerViewModel

class AddActivity : AppCompatActivity() {
    private lateinit var binding: ActivityAddBinding
    private lateinit var viewModel: BurgerViewModel

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_add)

        viewModel = BurgerViewModel()
        initBinding()
    }

    private fun initBinding() {
        binding = DataBindingUtil.setContentView(this, R.layout.activity_add)
        binding.lifecycleOwner = this
        binding.setVariable(BR.burgerVM, viewModel)
        binding.setVariable(BR.addAct, this)
    }

    fun startMainActivity(view: View) {
        startActivity(Intent(this, MainActivity::class.java))
    }
}