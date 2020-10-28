package com.khb.customburger

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.os.Handler
import com.khb.customburger.activity.AddActivity

class SplashActivity : AppCompatActivity() {
    override fun onResume() {
        super.onResume()
        Handler().postDelayed({
            val intent = Intent(this, AddActivity::class.java)
            startActivity(intent)
            finish()
        }, 1300)
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_splash)
    }
}