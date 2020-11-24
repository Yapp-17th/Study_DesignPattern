package com.khb.dictionary

import android.app.Application
import com.khb.dictionary.module.apiModule
import com.khb.dictionary.module.mainAdapterModule
import com.khb.dictionary.module.mainPresenterModule
import com.khb.dictionary.module.networkModule
import org.koin.android.ext.koin.androidContext
import org.koin.core.context.startKoin

class DictionaryApplication: Application() {

    override fun onCreate() {
        super.onCreate()

        startKoin {
            androidContext(this@DictionaryApplication)
            modules(
                listOf(
                    mainPresenterModule,
                    networkModule,
                    apiModule,
                    mainAdapterModule
                )
            )
        }
    }
}