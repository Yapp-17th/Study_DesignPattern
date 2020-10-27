package com.khb.customburger.database

import android.content.Context
import androidx.room.Database
import androidx.room.Room
import androidx.room.RoomDatabase

@Database(entities = [Material::class], version = 1)
abstract class MaterialDatabase: RoomDatabase() {
    abstract fun materialDao(): MaterialDao

    companion object {
        @Volatile
        private var INSTANCE: MaterialDatabase? = null

        fun getInstance(context: Context): MaterialDatabase? {
            INSTANCE?.let { return it } ?: return initInstance(context)
        }

        private fun initInstance(context: Context): MaterialDatabase? {
            synchronized(MaterialDatabase::class) {
                INSTANCE = Room.databaseBuilder(context.applicationContext, MaterialDatabase::class.java, "material")
                    .fallbackToDestructiveMigration() // 데이터베이스가 갱신될 때 기존의 테이블을 버리고 새로 사용
                    .build()
                return INSTANCE
            }
        }
    }
}