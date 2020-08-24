package com.khb.coffeesystem.model

import com.khb.coffeesystem.ShowManager
import com.khb.coffeesystem.datamodel.Coffee
import com.khb.coffeesystem.datamodel.MenuItem
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.delay
import kotlinx.coroutines.launch
import kotlinx.coroutines.runBlocking

object BaristaManager {
    private var barista1 = Barista(1)
    private var barista2 = Barista(2)

    fun giveWorkToBarista(menuItem: MenuItem): Coffee? {
        // 바리스타에게 일을 줘요

        return null
    }
}