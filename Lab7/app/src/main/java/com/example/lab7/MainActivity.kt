package com.example.lab7

import android.os.Bundle
import android.view.View
import android.widget.EditText
import android.widget.ImageView
import android.widget.TextView
import androidx.appcompat.app.AppCompatActivity

class MainActivity : AppCompatActivity() {
    lateinit var editName: EditText
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
        editName = findViewById(R.id.editTextName)
    }

    fun say(view: View) {
        //TextView
        val faText = findViewById<TextView>(R.id.textMessage)


        //EditText
        editName = findViewById<EditText>(R.id.editTextName)
        val name = editName.text

        //Message
        faText.setText("Happy Holidays " + name + "!")

        //Image
        val imageTree = findViewById<ImageView>(R.id.imageView)
        imageTree.setImageResource(R.drawable.tree)

    }
}