package com.example.quiz

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.util.Log
import android.view.View
import kotlinx.android.synthetic.main.activity_questions.*
import android.content.Intent as Intent

//set class as OnClickListener pulled from https://www.youtube.com/watch?v=b21fiIyOW4A 1:22

class QuestionsActivity : AppCompatActivity(), View.OnClickListener {

    //so that we start at question 1 each time this activity is opened
    private var currentQuestion: Int = 1

    //array of questions from our question class we created
    //null bc we need an object to set variable to
    private var aQuestionsList: ArrayList<Question>? = null

    private var count: Int = 0

    private var aUserName: String? = null

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_questions)

        //sending to constants
        aUserName = intent.getStringExtra(Constants.name)

        aQuestionsList = Constants.getQ()
        //check to see if questions are being added:
//        Log.i("Questions Size", "${questionsList.size}")

        nextQuestion()

        option1.setOnClickListener(this)
        option2.setOnClickListener(this)
        option3.setOnClickListener(this)
        option4.setOnClickListener(this)
    }

    private fun nextQuestion() {
        // - 1 to account for 0 index
        val newQuestion = aQuestionsList!![currentQuestion - 1]

        //set question
        //!! converts a value to a boolean and ensures a boolean type.
        quizQuestion.text = newQuestion.question

        option1.text = newQuestion.option1
        option2.text = newQuestion.option2
        option3.text = newQuestion.option3
        option4.text = newQuestion.option4
    }

    override fun onClick(v: View?) {
        //https://kotlinlang.org/docs/reference/control-flow.html
        when (v?.id) {
            R.id.option1 -> {
                count += 1
                currentQuestion++
            }
            R.id.option2 -> {
                count += 2
                currentQuestion++
            }
            R.id.option3 -> {
                count += 3
                currentQuestion++
            }
            R.id.option4 -> {
                count += 4
                currentQuestion++
            }

        }
            if (currentQuestion != aQuestionsList!!.size) {
                nextQuestion()
            } else if (currentQuestion == aQuestionsList!!.size) {
                val intent = Intent(this, resultsActivity::class.java)
                intent.putExtra(Constants.name, aUserName)
                intent.putExtra(Constants.count, count)
                startActivity(intent)
            }
        }

}