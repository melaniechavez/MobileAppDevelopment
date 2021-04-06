package com.example.lab7.sample

import com.example.lab7.R
import com.example.lab7.model.Book

object SampleData {
    val bookList = ArrayList<Book>()
    init {
        bookList.add(Book("A Tale of Two Cities", R.drawable.two))
        bookList.add(Book("The Great Gatsby", R.drawable.gg))
        bookList.add(Book ("Things Fall Apart", R.drawable.fall))
        bookList.add(Book("Absalom, Absalom!", R.drawable.aa))
        bookList.add(Book("Catch 22", R.drawable.catch2))
    } }