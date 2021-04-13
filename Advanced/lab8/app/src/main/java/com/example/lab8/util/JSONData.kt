package com.example.lab8.util

import android.content.Context
import android.graphics.Movie
import android.util.Log
import com.android.volley.Request
import com.android.volley.Response
import com.android.volley.toolbox.StringRequest
import com.android.volley.toolbox.Volley
import com.example.lab8.model.Cat
import com.example.lab8.model.CatViewModel
import org.json.JSONException
import org.json.JSONObject

class JSONData {
    val dataList = ArrayList<Cat>()
    val api_url = "https://thecatapi.com/v1/images?api_key="
    val api_key = "3d70be9c-0a5a-48c5-bc48-e31aa0a1daee"

    fun getJSON(context: Context): ArrayList<Cat>{
        var json = loadJSON(context)
        return dataList
    }

    fun loadJSON(context: Context) {
        val url = api_url + api_key

        // instantiate the Volley request queue
        val queue = Volley.newRequestQueue(context)

        //Request a string response from the provided URL
        val stringRequest = StringRequest(
            Request.Method.GET, url,
            Response.Listener<String> { response ->
                parseJSON(response)
            },
            Response.ErrorListener {
                Log.e("ERROR", error("request failed"))
            })

        //add the request to the RequestQueue
        queue.add(stringRequest)
    }

    //fun parseJSON(response: String, catViewModel: CatViewModel)
    fun parseJSON(response: String){

        // Base url for the pics
        val picture_base_url = "https://api.thecatapi.com/v1/images/search"
        try {
            //create JSONObject
            val jsonObject = JSONObject(response)

            //create JSONArray with the value from the results key
            //confused bc inital array doesnt have a name?? https://docs.thecatapi.com/api-reference/images/images-search
            //data is used in some example code but idk
            val dataArray = jsonObject.getJSONArray("data")

            //loop through each object in the array
            for (i in 0 until dataArray.length()){
                val catObject = dataArray.getJSONObject(i)

                //get values
                val id = catObject.getString("id")

                //save the fully qualified URL for the poster image
                val pictureURL = catObject.getString("url")

                //name is in another array called breeds?
                val name = catObject.getString("name")

                //create new movie object
                val newCat = Cat(id, pictureURL, name)

                //add character object to our ArrayList
                dataList.add(newCat)
            }
        } catch (e: JSONException) {
            e.printStackTrace()
        }
//        catViewModel.catList.value = dataList
        //will tell me if parsing worked:
        Log.i("json data list value", dataList.size.toString())
    }
}