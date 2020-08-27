package phm.example.mission1

import android.util.Log

class Barista{

    init {
        Log.d("Mission1","barista init")
    }

    fun makeCoffee(menuItem: MenuItem):Coffee{

        var coffee: Coffee = Coffee(menuItem)

        return coffee
    }
}