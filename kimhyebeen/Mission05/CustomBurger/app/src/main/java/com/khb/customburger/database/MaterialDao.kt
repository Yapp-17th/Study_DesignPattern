package com.khb.customburger.database

import androidx.lifecycle.LiveData
import androidx.room.*

@Dao
interface MaterialDao {
    @Query("SELECT * FROM material ORDER BY name ASC")
    fun getAll(): LiveData<List<Material>>

    @Insert(onConflict = OnConflictStrategy.REPLACE)
    fun insert(contact: Material)

    @Delete
    fun delete(contact: Material)
}