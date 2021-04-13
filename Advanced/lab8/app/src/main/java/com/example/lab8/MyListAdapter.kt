package com.example.lab8

import android.util.Log
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.ImageView
import android.widget.TextView
import androidx.recyclerview.widget.RecyclerView
import com.example.lab8.model.Cat
import com.example.lab8.model.CatViewModel
import com.squareup.picasso.Picasso

class MyListAdapter(private val catViewModel: CatViewModel): RecyclerView.Adapter<RecyclerView.ViewHolder>() {

    private var myCatList = catViewModel.catList.value

    class ViewHolder(view: View): RecyclerView.ViewHolder(view){
        val nameTextView: TextView = view.findViewById(R.id.textView)
        val imageView: ImageView = view.findViewById(R.id.imageView)
    }

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): RecyclerView.ViewHolder {
        //create an instance of LayoutInflater
        val layoutInflater = LayoutInflater.from(parent.context)
        //inflate the view
        val itemViewHolder = layoutInflater.inflate(R.layout.card_list_item, parent, false)
        return ViewHolder(itemViewHolder)
    }

    override fun onBindViewHolder(holder: RecyclerView.ViewHolder, position: Int) {
        //get data at the position
        val cat = myCatList?.get(position)

        //set the text of the title textview to the name
        holder.nameTextView.text = cat?.name ?: ""

        //load image using Picasso
        Picasso.get().load(cat?.url ?: "")
            .error(R.drawable.image_placeholder)
            .placeholder(R.drawable.image_placeholder)
            .into(holder.imageView);
    }

    override fun getItemCount(): Int {
        if (myCatList != null) {
            return myCatList!!.size
        } else return 0
    }

    fun update(){
        myCatList = catViewModel.catList.value
        notifyDataSetChanged()
        Log.i("adapter update", catViewModel.catList.value?.size.toString())
    }

}