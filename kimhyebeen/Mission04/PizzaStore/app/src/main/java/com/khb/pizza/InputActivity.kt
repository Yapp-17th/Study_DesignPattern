package com.khb.pizza

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.EditText
import android.widget.Toast
import kotlinx.android.synthetic.main.activity_input.*

class InputActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_input)

        nextButton.setOnClickListener {
            if (!isEmpty(nameEditText) && !isEmpty(numberEditText) && !isEmpty(addressEditText)) {
                User(
                    nameEditText.text.toString(),
                    addressEditText.text.toString(),
                    numberEditText.text.toString()
                ).let {
                    Intent(this, MainActivity::class.java).apply {
                        putExtra("user", it)
                        startActivity(this)
                    }
                }
            } else {
                toast("입력을 제대로 해주세요")
            }
        }
    }

    private fun isEmpty(target: EditText): Boolean {
        if (target.text.toString() == "") return true
        return false
    }

    private fun toast(str: String) {
        Toast.makeText(this, str, Toast.LENGTH_SHORT).show()
    }
}