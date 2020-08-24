package com.example.mission2

import android.widget.TextView
import org.w3c.dom.Text

object Menu {

    private var items = mutableListOf(MenuItem("아메리카노",1500), MenuItem("카푸치노",2000)
        , MenuItem("카라멜 마키아또",2500), MenuItem("에스프레소",2500))

    fun choose(name: String): MenuItem? {
        for(each in items){
            if(each.getName().equals(name))
                return each
        }
        return null
    }

}