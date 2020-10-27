package com.khb.customburger.database

import androidx.room.Entity
import androidx.room.PrimaryKey

@Entity(tableName = "material")
data class Material(
        @PrimaryKey(autoGenerate = true)
        var id: Long?,
        var name: String,
        var taste: Int,
        var selected: Boolean
) {
        constructor(): this(null, "", 0, false)
}