package phm.example.mission1

import android.util.Log

class Coffee(menuItem: MenuItem) {

    private var name: String
    private var price: Int

    init {

        Log.d("Mission1","coffee init")

        this.name = menuItem.getName()
        this.price = menuItem.cost()
    }

}