package com.khb.pizza

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import com.khb.pizza.model.Menu
import com.khb.pizza.model.User

class StatusActivity : AppCompatActivity() {
    private lateinit var user: User
    private lateinit var menu: Menu

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_status)

        user = intent.getSerializableExtra("user") as User
        menu = intent.getSerializableExtra("menu") as Menu
    }
}