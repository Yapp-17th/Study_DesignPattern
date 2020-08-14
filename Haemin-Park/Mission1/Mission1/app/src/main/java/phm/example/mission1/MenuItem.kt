package phm.example.mission1

import android.util.Log

class MenuItem(name: String, price: Int) {

    private var name: String
    private var price: Int

    init {

        Log.d("Mission1","menuItem init")

        this.name = name
        this.price = price
    }

    fun cost() = price
    fun getName() = name
}