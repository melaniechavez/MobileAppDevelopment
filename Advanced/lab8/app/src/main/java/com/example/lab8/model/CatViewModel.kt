package com.example.lab8.model

import android.content.Context
import android.util.Log
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel
import com.example.lab8.util.JSONData

class CatViewModel: ViewModel() {
    val catList = MutableLiveData<ArrayList<Cat>>()

    fun loadData(context: Context){
        val loader = JSONData()
        catList.value = loader.getJSON(context)
        Log.i("vm load data list value", catList.value?.size.toString())
    }
}