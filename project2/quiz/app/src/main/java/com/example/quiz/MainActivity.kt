package com.example.quiz

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import com.google.android.material.snackbar.Snackbar
import kotlinx.android.synthetic.main.activity_main.*

class MainActivity : AppCompatActivity() {
//    lateinit var editName: EditText
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        start.setOnClickListener {
            if(userName.text.toString().isEmpty()){
                Snackbar.make(root_layout, "Please enter your name", Snackbar.LENGTH_SHORT).show()
            } else{
                //create intent
                val intent = Intent(this, QuestionsActivity::class.java)
                //send name to Questions Activity
                intent.putExtra(Constants.name, userName.text.toString())
                startActivity(intent)
                finish() //close this activity
            }
        }
//        editName = findViewById(R.id.name)
    }
}