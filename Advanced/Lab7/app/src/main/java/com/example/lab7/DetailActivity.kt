package com.example.lab7

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.ImageView
import android.widget.TextView

class DetailActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_detail)

        //get intent
        val name = intent.getStringExtra("name")
        val resourceID = intent.getIntExtra("resourceID", -1)

        //update view
        val bookImage:ImageView = findViewById(R.id.imageViewBook)
        bookImage.setImageResource(resourceID)
        val bookName:TextView = findViewById(R.id.textViewName)
        bookName.text = name
    }
}