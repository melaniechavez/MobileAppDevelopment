package com.example.lab8

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.util.Log
import androidx.activity.viewModels
import androidx.recyclerview.widget.LinearLayoutManager
import androidx.recyclerview.widget.RecyclerView
import com.example.lab8.model.CatViewModel
import com.example.lab8.util.JSONData

class MainActivity : AppCompatActivity() {

    private val viewModel: CatViewModel by viewModels()

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        //only load the JSON data once per app lifetime
        if (viewModel.catList.value == null){
            viewModel.loadData(this)
            Log.i("main", "in if to load data")
        }

        //get the recycler view
        val recyclerView: RecyclerView = findViewById(R.id.recylcerView)

        //set a layout manager on the recycler view
        recyclerView.layoutManager = LinearLayoutManager(this, LinearLayoutManager.VERTICAL, false)

        //define an adapter
        val adapter = MyListAdapter(viewModel)

        //assign the adapter to the recycle view
        recyclerView.adapter = adapter

        //create the observer
        viewModel.catList.observe(this, Observer {
            adapter.update()
        })
    }
}