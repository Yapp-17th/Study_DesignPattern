package com.khb.dictionary

import android.annotation.SuppressLint
import android.app.Activity
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.os.Handler
import android.view.View
import android.view.inputmethod.InputMethodManager
import androidx.databinding.DataBindingUtil
import androidx.recyclerview.widget.LinearLayoutManager
import com.khb.dictionary.adapter.SearchAdapter
import com.khb.dictionary.databinding.ActivityMainBinding

class MainActivity : AppCompatActivity() {
    private lateinit var binding: ActivityMainBinding
    private val searchAdapter = SearchAdapter()
    private val vm = DictionaryViewModel()

    @SuppressLint("ClickableViewAccessibility")
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        binding = DataBindingUtil.setContentView(this, R.layout.activity_main)
        binding.apply {
            lifecycleOwner = this@MainActivity
            setVariable(BR.vm, vm)

            activityView.setOnTouchListener { _, _ -> onHideKeypad() }
            mainRecyclerView.apply {
                adapter = searchAdapter
                layoutManager = LinearLayoutManager(applicationContext)
                setHasFixedSize(true)
                setOnTouchListener { _, _ -> onHideKeypad() }
            }
        }

        vm.searchList.observe(this, {
            searchAdapter.setContents(it)
        })
    }

    private fun onHideKeypad(): Boolean {
        val imm = getSystemService(Activity.INPUT_METHOD_SERVICE) as InputMethodManager
        val view: View = currentFocus ?: View(this)
        view.clearFocus()
        imm.hideSoftInputFromWindow(view.windowToken, 0)
        return false
    }
}