package com.example.lab7

import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.TextView
import androidx.recyclerview.widget.RecyclerView
import com.example.lab7.model.Book

class BookAdapter(private val bookList: ArrayList<Book>, private val clickListener:(Book) -> Unit): RecyclerView.Adapter<BookAdapter.ViewHolder>() {

    class ViewHolder(view: View): RecyclerView.ViewHolder(view) {
        val bookTextView: TextView = view.findViewById(R.id.textView)
    }

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): ViewHolder {
        //create an instance of LayoutInflater
        val layoutInflater = LayoutInflater.from(parent.context)

        //inflate the view
        val itemViewHolder = layoutInflater.inflate(R.layout.list_item, parent, false)
        return ViewHolder(itemViewHolder)
    }

    override fun onBindViewHolder(holder: ViewHolder, position: Int) {
        //get data at the position
        val book = bookList[position]

        //set the text of the textview to the name
        holder.bookTextView.text = book.name

        //assign click listener
        holder.itemView.setOnClickListener{clickListener(book)}
    }

    override fun getItemCount() = bookList.size

}