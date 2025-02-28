// ignore: file_names
import 'package:flutter/material.dart';

void main() => runApp(QuizApp());

class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz Website',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: QuizHomePage(),
    );
  }
}

class QuizHomePage extends StatefulWidget {
  const QuizHomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _QuizHomePageState createState() => _QuizHomePageState();
}

class _QuizHomePageState extends State<QuizHomePage> {
  int _currentQuestionIndex = 0;
  int _score = 0;

  // ignore: prefer_final_fields
  List<Map<String, Object>> _questions = [
    {
      'question': 'What is the capital of France?',
      'answers': ['Paris', 'London', 'Rome', 'Berlin'],
      'correctAnswer': 'Paris',
    },
    {
      'question': 'What is the chemical symbol for water?',
      'answers': ['H2O', 'O2', 'CO2', 'H2'],
      'correctAnswer': 'H2O',
    },
    {
      'question': 'Who was the first president of the United States?',
      'answers': [
        'Thomas Jefferson',
        'Abraham Lincoln',
        'George Washington',
        'John Adams'
      ],
      'correctAnswer': 'George Washington',
    },
    {
      'question': 'Which country won the FIFA World Cup in 2018?',
      'answers': ['Germany', 'Brazil', 'France', 'Argentina'],
      'correctAnswer': 'France',
    },
    {
      'question': 'Who wrote the play "Romeo and Juliet"?',
      'answers': [
        'Charles Dickens',
        'Jane Austen',
        'William Shakespeare',
        'Mark Twain'
      ],
      'correctAnswer': 'William Shakespeare',
    },
    {
      'question': 'Which country is known as the Land of the Rising Sun?',
      'answers': ['China', 'Japan', 'Thailand', 'South Korea'],
      'correctAnswer': 'Japan',
    },
    {
      'question': 'Which planet is known as the Red Planet?',
      'answers': ['Earth', 'Mars', 'Jupiter', 'Venus'],
      'correctAnswer': 'Mars',
    },
    {
      'question': 'In what sport would you perform a slam dunk?',
      'answers': ['Football', 'Basketball', 'Tennis', 'Golf'],
      'correctAnswer': 'Basketball',
    },
    {
      'question':
          'In which book series would you find the character "Frodo Baggins"?',
      'answers': [
        'Harry Potter',
        'The Chronicles of Narnia',
        'The Lord of the Rings',
        'Percy Jackson'
      ],
      'correctAnswer': 'The Lord of the Rings',
    },
    {
      'question': 'What is the longest river in the world?',
      'answers': [
        'Amazon River',
        'Nile River',
        'Yangtze River',
        'Mississippi River'
      ],
      'correctAnswer': 'Nile River',
    },
    {
      'question': 'What is the most common gas in Earth’s atmosphere?',
      'answers': ['Oxygen', 'Carbon Dioxide', 'Nitrogen', 'Hydrogen'],
      'correctAnswer': 'Nitrogen',
    },
    {
      'question': 'In what year did World War II end?',
      'answers': ['1942', '1945', '1950', '1939'],
      'correctAnswer': '1945',
    },
    {
      'question': 'Which country is home to the sport of cricket?',
      'answers': ['Australia', 'India', 'South Africa', 'England'],
      'correctAnswer': 'England',
    },
  ];

  void _answerQuestion(String answer) {
    if (answer == _questions[_currentQuestionIndex]['correctAnswer']) {
      setState(() {
        _score++;
      });
    }
    setState(() {
      _currentQuestionIndex++;
    });
  }

  void _resetQuiz() {
    setState(() {
      _score = 0;
      _currentQuestionIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz Website'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Container(
        color: Colors.blue.shade50,
        padding: const EdgeInsets.all(20.0),
        child: _currentQuestionIndex < _questions.length
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    _questions[_currentQuestionIndex]['question'] as String,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurpleAccent,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 30),
                  ...(List<String>.from(_questions[_currentQuestionIndex]
                          ['answers'] as List<String>)
                      .map((answer) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      child: ElevatedButton(
                        onPressed: () => _answerQuestion(answer),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.yellow,
                          padding: EdgeInsets.symmetric(
                              horizontal: 30, vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          textStyle: TextStyle(fontSize: 18),
                        ),
                        child: Text(answer),
                      ),
                    );
                    // ignore: unnecessary_to_list_in_spreads
                  })).toList(),
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Quiz Completed! Your score is $_score/13',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple,
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _resetQuiz,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      textStyle: TextStyle(fontSize: 18),
                    ),
                    child: Text('Restart Quiz'),
                  ),
                ],
              ),
      ),
    );
  }
}
