package com.khb.printersystem.item

data class PrintItem(
    var time: String,
    var contents: String,
    var status: String,
    var touchable: Boolean
)