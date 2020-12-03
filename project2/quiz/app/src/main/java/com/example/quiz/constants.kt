package com.example.quiz
//from: https://www.youtube.com/watch?v=b21fiIyOW4A minute 37

object Constants{

    const val name: String = "name"
    const val count: String = "count"

    //use function to get questions (function will return an array list of questions) that are of type Question (our class)
    fun getQ(): ArrayList<Question>{
        val questionsList = ArrayList<Question>()
        val q1 = Question(1, "What is your favorite season?",
        "Summer", "Spring", "Fall", "Winter")
        val q2 = Question(1, "What is your favorite food?",
            "Seafood", "BBQ", "Pizza", "Burgers")
        val q3 = Question(1, "How do you get places?",
            "Bus", "Drive", "Subway", "Bike")
        val q4 = Question(1, "What is your favorite music genre?",
            "Alt. Rock", "Indie", "Pop", "EDM")
        val q5 = Question(1, "What is your favorite color?",
            "Blue", "Yellow", "Black", "Green")

        questionsList.add(q1)
        questionsList.add(q2)
        questionsList.add(q3)
        questionsList.add(q4)
        questionsList.add(q5)
        return questionsList
    }


}