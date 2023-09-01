import 'package:flutter/material.dart';
import 'quiz.dart';
import 'question.dart';
import 'answer.dart';
import 'result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _totalScore = 0;

  final _questions = const [
  {
    'question': 'Logical Aptitude: How do you feel about solving complex puzzles and logical problems? Please share your thoughts.',
    'answers': [
      {'text': 'Excited', 'score': 10, 'color': Colors.blue, 'textColor': Colors.white},
      {'text': 'Confident', 'score': 8, 'color': Colors.green, 'textColor': Colors.white},
      {'text': 'Neutral', 'score': 5, 'color': Colors.grey, 'textColor': Colors.black},
      {'text': 'Challenged', 'score': 3, 'color': Colors.orange, 'textColor': Colors.white},
      {'text': 'Anxious', 'score': 1, 'color': Colors.red, 'textColor': Colors.white},
    ],
  },
  {
    'question': 'Creativity Aptitude: Describe your emotions when you\'re asked to come up with innovative ideas or creative solutions to challenges.',
    'answers': [
      {'text': 'Eager', 'score': 10, 'color': Colors.blue, 'textColor': Colors.white},
      {'text': 'Inspired', 'score': 8, 'color': Colors.green, 'textColor': Colors.white},
      {'text': 'Neutral', 'score': 5, 'color': Colors.grey, 'textColor': Colors.black},
      {'text': 'Intrigued', 'score': 3, 'color': Colors.orange, 'textColor': Colors.white},
      {'text': 'Overwhelmed', 'score': 1, 'color': Colors.red, 'textColor': Colors.white},
    ],
  },
  {
    'question': 'Numerical Aptitude: How confident do you feel when working with numbers and mathematical calculations? Please express your emotions.',
    'answers': [
      {'text': 'Very Confident', 'score': 10, 'color': Colors.blue, 'textColor': Colors.white},
      {'text': 'Confident', 'score': 8, 'color': Colors.green, 'textColor': Colors.white},
      {'text': 'Neutral', 'score': 5, 'color': Colors.grey, 'textColor': Colors.black},
      {'text': 'Somewhat Anxious', 'score': 3, 'color': Colors.orange, 'textColor': Colors.white},
      {'text': 'Terrified', 'score': 1, 'color': Colors.red, 'textColor': Colors.white},
    ],
  },
  {
    'question': 'Verbal Aptitude: Share your feelings when asked to analyze and interpret written passages or when engaging in discussions about literature.',
    'answers': [
      {'text': 'Enthusiastic', 'score': 10, 'color': Colors.blue, 'textColor': Colors.white},
      {'text': 'Engaged', 'score': 8, 'color': Colors.green, 'textColor': Colors.white},
      {'text': 'Neutral', 'score': 5, 'color': Colors.grey, 'textColor': Colors.black},
      {'text': 'Slightly Anxious', 'score': 3, 'color': Colors.orange, 'textColor': Colors.white},
      {'text': 'Overwhelmed', 'score': 1, 'color': Colors.red, 'textColor': Colors.white},
    ],
  },
  {
    'question': 'Problem-Solving Aptitude: How do you react when presented with a difficult problem that requires critical thinking and problem-solving skills?',
    'answers': [
      {'text': 'Excited to Solve', 'score': 10, 'color': Colors.blue, 'textColor': Colors.white},
      {'text': 'Ready to Tackle', 'score': 8, 'color': Colors.green, 'textColor': Colors.white},
      {'text': 'Neutral', 'score': 5, 'color': Colors.grey, 'textColor': Colors.black},
      {'text': 'Slightly Anxious', 'score': 3, 'color': Colors.orange, 'textColor': Colors.white},
      {'text': 'Overwhelmed', 'score': 1, 'color': Colors.red, 'textColor': Colors.white},
    ],
  },
  {
    'question': 'Spatial Reasoning Aptitude: Describe your emotions when asked to visualize and manipulate shapes, patterns, and objects in your mind.',
    'answers': [
      {'text': 'Easily Visualize', 'score': 10, 'color': Colors.blue, 'textColor': Colors.white},
      {'text': 'Comfortable', 'score': 8, 'color': Colors.green, 'textColor': Colors.white},
      {'text': 'Neutral', 'score': 5, 'color': Colors.grey, 'textColor': Colors.black},
      {'text': 'Slightly Anxious', 'score': 3, 'color': Colors.orange, 'textColor': Colors.white},
      {'text': 'Struggle to Visualize', 'score': 1, 'color': Colors.red, 'textColor': Colors.white},
    ],
  },
  {
    'question': 'Communication Aptitude: How comfortable are you when it comes to expressing your ideas and thoughts clearly to others, both in writing and verbally?',
    'answers': [
      {'text': 'Very Comfortable', 'score': 10, 'color': Colors.blue, 'textColor': Colors.white},
      {'text': 'Comfortable', 'score': 8, 'color': Colors.green, 'textColor': Colors.white},
      {'text': 'Neutral', 'score': 5, 'color': Colors.grey, 'textColor': Colors.black},
      {'text': 'Slightly Anxious', 'score': 3, 'color': Colors.orange, 'textColor': Colors.white},
      {'text': 'Nervous', 'score': 1, 'color': Colors.red, 'textColor': Colors.white},
    ],
  },
  {
    'question': 'Attention to Detail: When given tasks that require careful attention to details, how do you typically feel about tackling them?',
    'answers': [
      {'text': 'Detail-Oriented', 'score': 10, 'color': Colors.blue, 'textColor': Colors.white},
      {'text': 'Focused', 'score': 8, 'color': Colors.green, 'textColor': Colors.white},
      {'text': 'Neutral', 'score': 5, 'color': Colors.grey, 'textColor': Colors.black},
      {'text': 'Slightly Overwhelmed', 'score': 3, 'color': Colors.orange, 'textColor': Colors.white},
      {'text': 'Overwhelmed', 'score': 1, 'color': Colors.red, 'textColor': Colors.white},
    ],
  },
  {
    'question': 'Leadership Aptitude: Share your emotions about taking on leadership roles and responsibilities in group projects or activities.',
    'answers': [
      {'text': 'Natural Leader', 'score': 10, 'color': Colors.blue, 'textColor': Colors.white},
      {'text': 'Confident Leader', 'score': 8, 'color': Colors.green, 'textColor': Colors.white},
      {'text': 'Neutral', 'score': 5, 'color': Colors.grey, 'textColor': Colors.black},
      {'text': 'Slightly Anxious', 'score': 3, 'color': Colors.orange, 'textColor': Colors.white},
      {'text': 'Not Comfortable', 'score': 1, 'color': Colors.red, 'textColor': Colors.white},
    ],
  },
  {
    'question': 'Time Management Aptitude: How do you handle situations that demand effective time management and organization skills? Please express your feelings.',
    'answers': [
      {'text': 'Excellent Time Manager', 'score': 10, 'color': Colors.blue, 'textColor': Colors.white},
      {'text': 'Effective Organizer', 'score': 8, 'color': Colors.green, 'textColor': Colors.white},
      {'text': 'Neutral', 'score': 5, 'color': Colors.grey, 'textColor': Colors.black},
      {'text': 'Slightly Anxious', 'score': 3, 'color': Colors.orange, 'textColor': Colors.white},
      {'text': 'Procrastinator', 'score': 1, 'color': Colors.red, 'textColor': Colors.white},
    ],
  },
];


  void _reset() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore = _totalScore + score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
   return MaterialApp(
  home: Scaffold(
    backgroundColor: Colors.indigo,
    body: SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: _questionIndex < _questions.length
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      
                      SizedBox(height: 24),
                      Quiz(
                        answerQuestion: _answerQuestion,
                        questionIndex: _questionIndex,
                        questions: _questions,
                      ),
                    ],
                  )
                : Center(
                    child: Result(
                      _totalScore,
                      _reset,
                    ),
                  ),
          ),
        ),
      ),
    ),
  ),
);

  }
}
