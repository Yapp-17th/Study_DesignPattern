package com.khb.dictionary.main

import android.annotation.SuppressLint
import android.app.Activity
import android.os.Bundle
import android.view.View
import android.view.inputmethod.InputMethodManager
import android.widget.Toast
import androidx.recyclerview.widget.LinearLayoutManager
import com.khb.dictionary.R
import com.khb.dictionary.base.BaseActivity
import com.khb.dictionary.base.MainContract
import com.khb.dictionary.model.DictionaryItem
import kotlinx.android.synthetic.main.activity_main.*
import org.koin.android.ext.android.inject

class MainActivity
    : BaseActivity(R.layout.activity_main), MainContract.View {
    private val presenter: MainPresenter by inject()
    private val mainAdapter: MainAdapter by inject()

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        setAdapter()
        setButton()
    }

    override fun initPresenter() { // BaseActivity
        presenter.takeView(this)
    }

    override fun showError(error: String) { // BaseView
        Toast.makeText(this, error, Toast.LENGTH_SHORT).show()
    }

    @SuppressLint("ClickableViewAccessibility")
    override fun setAdapter() { // MainContract.View
        main_recycler_view.apply {
            adapter = mainAdapter
            layoutManager = LinearLayoutManager(context)
            setHasFixedSize(true)
            setOnTouchListener { _, _ -> onHideKeypad() }
        }
    }

    override fun setButton() { // MainContract.View
        main_search_button.setOnClickListener {
            val keyword = main_search_edit_text.text.toString()
            presenter.getDictionaryData(keyword)
        }
    }

    override fun showDictionaryList(list: List<DictionaryItem>) { // MainContract.View
        mainAdapter.setItems(list)
    }

    private fun onHideKeypad(): Boolean {
        val imm = getSystemService(Activity.INPUT_METHOD_SERVICE) as InputMethodManager
        val view: View = currentFocus ?: View(this)
        view.clearFocus()
        imm.hideSoftInputFromWindow(view.windowToken, 0)
        return false
    }
}