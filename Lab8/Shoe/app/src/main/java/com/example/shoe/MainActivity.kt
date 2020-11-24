package com.example.shoe

import android.app.Activity
import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.util.Log
import android.view.View
import android.widget.RadioButton
import com.google.android.material.snackbar.Snackbar
import kotlinx.android.synthetic.main.activity_main.*

class MainActivity : AppCompatActivity() {
    private var myShoeShop = ShoeStore();
    private var selectedLocationPosition = 0
    private val REQUEST_CODE = 0
    var globalMessage = ""

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        //event listener:
        locationButton.setOnClickListener{
            selectedLocationPosition = spinner.selectedItemPosition
            myShoeShop.suggestShoeStore(selectedLocationPosition)
            Log.i("shop suggested", myShoeShop.name);
            Log.i("url suggested", myShoeShop.url)

            //create intent:
            val intent = Intent(this, ShoeActivity::class.java)
            intent.putExtra("shoeStoreName", myShoeShop.name)
            intent.putExtra("shoeStoreURL", myShoeShop.url)

            //startActivity(intent)

            startActivityForResult(intent, REQUEST_CODE)
        }
    }

    fun createShoe(view: View) {
        var height:CharSequence = ""
        var typeList = "" //string

        //radio buttons:
        val heightId = radioGroup.checkedRadioButtonId

        if(heightId == -1) {

            val  heightSnackbar = Snackbar.make(root_layout, "Please select a shoe height", Snackbar.LENGTH_SHORT)
            heightSnackbar.show()
        } else {
            height = findViewById<RadioButton>(heightId).text

            //checkboxes:
            if(checkBox1.isChecked) {
                typeList += " Platforms"
            }
            if(checkBox2.isChecked) {
                typeList += " Reflection"
            }
            if(checkBox3.isChecked) {
                typeList += " " + checkBox3.text
            }
            if(typeList.isNotEmpty()) {
                typeList = "with" + typeList
            }

            //spinner:
            val location = spinner.selectedItem

            //switch:
            if(switch1.isChecked){
                height = switch1.text.toString() + " $height"
            }

            //text view:
//            message.text = "You'd like a $height shoe $typeList $location"
//            globalMessage = "${message.text}"
            globalMessage = "You'd like a $height $location shoe $typeList"

            updateUI()
        }
    }

    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        super.onActivityResult(requestCode, resultCode, data)
        if((requestCode == REQUEST_CODE) && (resultCode == Activity.RESULT_OK)) {
            reviewTextView.setText(data?.let{data.getStringExtra("feedback")})
        }
    }

    fun updateUI(){
        message.text = globalMessage
        //reviewTextView.text
    }

    override fun onSaveInstanceState(outState: Bundle) {
        outState.putString("globalMessage", globalMessage)
        //outState.putString("reviewTextView", reviewTextView)
        super.onSaveInstanceState(outState)
    }

    override fun onRestoreInstanceState(savedInstanceState: Bundle) {
        super.onRestoreInstanceState(savedInstanceState)
        globalMessage = savedInstanceState.getString("globalMessage", "")
        //reviewTextView = savedInstanceState.getString("reviewTextView", "")
        updateUI()
    }
}