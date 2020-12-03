package com.example.quiz

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import kotlinx.android.synthetic.main.activity_results.*

class resultsActivity : AppCompatActivity() {
    private var cityResult: String = ""
    private var why: String = ""

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_results)

        //https://developer.android.com/reference/android/content/Intent:
        val name = intent.getStringExtra(Constants.name)
        val count = intent.getIntExtra(Constants.count, 0)

        if(count <= 6){
            cityResult = "Seattle"
            why = "You are love rain almost as much as you are obsessed with a good cup of coffee. You're an avid adventurer" +
                    " who is always looking for the next thrill"
            cityPic.setImageResource(R.drawable.seattle)
        } else if(6 < count && count <= 10){
            cityResult = "Austin"
            why = "You could not survive in a cold city, good thing Austin is hot and sunny year round. You're a huge dog person" +
                    " who also loves live music but knows a thing or two about tech."
            cityPic.setImageResource(R.drawable.austin)
        } else if(10 < count && count <= 15){
            cityResult = "New York City"
            why = "You're a big dreamer that doesn't mind the busy life. You are always go go go but that only helps you achieve your large goals. "
            cityPic.setImageResource(R.drawable.nyc)
        } else if(15 < count && count <= 20){
            cityResult = "Denver"
            why = "If you were a dog you'd be a golden retriever. You love adventure but also a nice relaxig day, the best of both worlds!"
            cityPic.setImageResource(R.drawable.denver)
        }

        city.setText(name + ", you belong in " + cityResult + "!")
        cityDescription.text = why

        retry.setOnClickListener{startActivity(Intent(this, MainActivity::class.java))}

        //https://stackoverflow.com/questions/17167701/how-to-activate-share-button-in-android-app:
        share.setOnClickListener {
            val intent = Intent()
            intent.action = Intent.ACTION_SEND
            intent.putExtra(Intent.EXTRA_TEXT, "I should live in " + cityResult + "! Where should you live?")
            intent.type="text/plain"
            startActivity(Intent.createChooser(intent,"Share To:"))
        }

    }
}