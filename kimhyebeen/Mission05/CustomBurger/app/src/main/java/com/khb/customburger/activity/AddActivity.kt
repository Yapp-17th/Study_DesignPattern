package com.khb.customburger.activity

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.view.View
import androidx.databinding.DataBindingUtil
import com.khb.customburger.BR
import com.khb.customburger.R
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
        startActivity(getMainIntent())
    }

    private fun getMainIntent(): Intent {
        val intent = Intent(this, MainActivity::class.java)
        intent.apply {
            for (id in 0..5) {
                viewModel._burgerList[id].value?.let {
                    when(id) {
                        0 -> putExtra("cabbage", it)
                        1 -> putExtra("cheese", it)
                        2 -> putExtra("shrimp", it)
                        3 -> putExtra("tomato", it)
                        4 -> putExtra("patty01", it)
                        5 -> putExtra("patty02", it)
                        else -> throw Exception("add activity : id is wrong.")
                    }
                } ?: when(id) {
                    0 -> putExtra("cabbage", false)
                    1 -> putExtra("cheese", false)
                    2 -> putExtra("shrimp", false)
                    3 -> putExtra("tomato", false)
                    4 -> putExtra("patty01", false)
                    5 -> putExtra("patty02", false)
                    else -> throw Exception("add activity : id is wrong.")
                }
            }
        }
        return intent
    }
}