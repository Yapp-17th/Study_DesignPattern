package com.khb.dictionary.module

import com.khb.dictionary.main.MainPresenter
import org.koin.dsl.module

val mainPresenterModule = module {
    single { networkModule }

    factory { MainPresenter(get()) }
}