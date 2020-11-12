package com.example.shoe

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.view.View
import android.widget.RadioButton
import com.google.android.material.snackbar.Snackbar
import kotlinx.android.synthetic.main.activity_main.*

class MainActivity : AppCompatActivity() {
    var globalMessage = ""

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
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
            val location = "and " + spinner.selectedItem

            //switch:
            if(switch1.isChecked){
                height = switch1.text.toString() + " $height"
            }

            //text view:
//            message.text = "You'd like a $height shoe $typeList $location"
//            globalMessage = "${message.text}"
            globalMessage = "You'd like a $height shoe $typeList $location"

            updateUI()
        }
    }

    fun updateUI(){
        message.text = globalMessage
    }

    override fun onSaveInstanceState(outState: Bundle) {
        outState.putString("globalMessage", globalMessage)
        super.onSaveInstanceState(outState)
    }

    override fun onRestoreInstanceState(savedInstanceState: Bundle) {
        super.onRestoreInstanceState(savedInstanceState)
        globalMessage = savedInstanceState.getString("globalMessage", "")
        updateUI()
    }
}