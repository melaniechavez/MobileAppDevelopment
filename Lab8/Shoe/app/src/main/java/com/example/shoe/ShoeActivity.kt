package com.example.shoe

import android.app.Activity
import android.content.Intent
import android.net.Uri
import android.os.Bundle
import android.util.Log
import com.google.android.material.floatingactionbutton.FloatingActionButton
import com.google.android.material.snackbar.Snackbar
import androidx.appcompat.app.AppCompatActivity
import kotlinx.android.synthetic.main.content_shoe.*

class ShoeActivity : AppCompatActivity() {
    private var shoeStoreName : String? = null
    private var shoeStoreUrl : String? = null

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_shoe)
        setSupportActionBar(findViewById(R.id.toolbar))

        shoeStoreName = intent.getStringExtra("shoeStoreName")
        shoeStoreUrl = intent.getStringExtra("shoeStoreURL")

        shoeStoreName?.let { Log.i("store received", it)};
        shoeStoreUrl?.let { Log.i("url received", it)};

        shoeStoreName?.let {shoeShopTextView.text = "You should get shoes from $shoeStoreName "}

        findViewById<FloatingActionButton>(R.id.fab).setOnClickListener { loadWebSite() }
    }

    fun loadWebSite(){
        var intent = Intent()
        intent.action = Intent.ACTION_VIEW
        intent.data = shoeStoreUrl?.let{ Uri.parse(shoeStoreUrl)}

        if(intent.resolveActivity(packageManager) != null){
            startActivity(intent)
        }
    }

    override fun onBackPressed() {
        val data = Intent()
        data.putExtra("feedback", feedbackEditText.text.toString())
        setResult(Activity.RESULT_OK, data)
        super.onBackPressed()
        finish()
    }
}