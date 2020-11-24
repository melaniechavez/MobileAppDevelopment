package com.example.shoe

data class ShoeStore(var name:String="", var url:String="") {
    fun suggestShoeStore(position:Int){
        setShoeStoreName(position)
        setShoeStoreUrl(position)
    }

    private fun setShoeStoreName(position:Int){
        when(position){
            0 -> name = "Dr. Martens"
            1 -> name = "Converse"
            2 -> name = "Nike"
            else -> name = "shoe brand of your choice"
        }
    }

    private fun setShoeStoreUrl(position:Int){
        when(position){
            0 -> url = "https://www.drmartens.com/us/en/"
            1 -> url = "https://www.converse.com/"
            2 -> url = "https://www.nike.com/"
            else -> url = "https://www.google.com/search?q=street+shoes"
        }
    }
}
