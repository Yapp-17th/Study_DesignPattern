package com.example.mission2

object Menu {

    private var items = mutableListOf(MenuItem("ame",1500), MenuItem("capu",2000)
        , MenuItem("cara",2500), MenuItem("esp",2500))

    fun choose(name: String): MenuItem? {
        for(each in items){
            if(each.getName().equals(name))
                return each
        }
        return null
    }

}