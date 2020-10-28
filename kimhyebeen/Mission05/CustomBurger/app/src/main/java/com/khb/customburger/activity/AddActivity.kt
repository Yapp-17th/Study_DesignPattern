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
        for (id in 0..5) {
            viewModel.getBurgerList()[id].value?.let { bool ->
                putExtraIntoIntent(intent, id, bool)
            } ?: putExtraIntoIntent(intent, id, false)
        }
        return intent
    }

    private fun putExtraIntoIntent(it: Intent, id: Int, value: Boolean) {
        when (id) {
            0 -> it.putExtra("cabbage", value)
            1 -> it.putExtra("cheese", value)
            2 -> it.putExtra("shrimp", value)
            3 -> it.putExtra("tomato", value)
            4 -> it.putExtra("patty01", value)
            5 -> it.putExtra("patty02", value)
            else -> throw Exception("add activity : id is wrong.")
        }
    }
}