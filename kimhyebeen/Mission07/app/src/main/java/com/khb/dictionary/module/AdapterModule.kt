package com.khb.dictionary.module

import com.khb.dictionary.main.MainAdapter
import org.koin.dsl.module

val mainAdapterModule = module {
    factory { MainAdapter() }
}