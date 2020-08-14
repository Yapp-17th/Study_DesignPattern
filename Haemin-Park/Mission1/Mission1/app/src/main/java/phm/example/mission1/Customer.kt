package phm.example.mission1

import android.util.Log

class Customer(val num: Int) {

    init {
        Log.d("Mission1","customer init: "+num)
    }

    fun order(menuName:String, menu:Menu, barista:Barista): Coffee?{

        var menuItem: MenuItem? = menu.choose(menuName)

        if(menuItem != null) {
            var coffee: Coffee = barista.makeCoffee(menuItem)
            return coffee
        }
        else{
            return null
        }
    }
}