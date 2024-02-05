//
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: QuizApp(),
    );
  }
}

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});
  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  List<Map<String, Object>> questions = [
    {
      'questionText': 'What is Flutter?',
      'answers': [
        {
          'text': 'A programming language',
          'score': 0,
        },
        {
          'text': 'A framework for building mobile apps',
          'score': 1,
        },
        {
          'text': 'A database management system',
          'score': 0,
        },
        {
          'text': 'A cloud computing platform',
          'score': 0,
        },
      ],
    },
    {
      'questionText': 'Which programming language is used in Flutter?',
      'answers': [
        {
          'text': 'Java',
          'score': 0,
        },
        {
          'text': 'Kotlin',
          'score': 0,
        },
        {
          'text': 'Dart',
          'score': 1,
        },
        {
          'text': 'Swift',
          'score': 0,
        },
      ],
    },
    {
      'questionText': 'What does the `async` keyword indicate in Dart?',
      'answers': [
        {
          'text': 'It defines a new asynchronous function',
          'score': 1,
        },
        {
          'text': 'It creates a synchronous function',
          'score': 0,
        },
        {
          'text': 'It declares a variable as asynchronous',
          'score': 0,
        },
        {
          'text': 'It has no specific meaning in Dart',
          'score': 0,
        },
      ],
    },
    {
      'questionText': 'Which widget is used to display an image in Flutter?',
      'answers': [
        {
          'text': 'ImageWidget',
          'score': 0,
        },
        {
          'text': 'ImageBox',
          'score': 0,
        },
        {
          'text': 'Image',
          'score': 1,
        },
        {
          'text': 'ImageView',
          'score': 0,
        },
      ],
    },
    {
      'questionText': 'What is the widget tree in Flutter?',
      'answers': [
        {
          'text': 'A data structure for storing images',
          'score': 0,
        },
        {
          'text': 'A hierarchical structure of UI elements',
          'score': 1,
        },
        {
          'text': 'A layout algorithm',
          'score': 0,
        },
        {
          'text': 'A networking component',
          'score': 0,
        },
      ],
    },
    {
      'questionText': 'Which command is used to create a new Flutter project?',
      'answers': [
        {
          'text': 'flutter build',
          'score': 0,
        },
        {
          'text': 'flutter init',
          'score': 0,
        },
        {
          'text': 'flutter create',
          'score': 1,
        },
        {
          'text': 'flutter start',
          'score': 0,
        },
      ],
    },
    {
      'questionText':
          'What is the purpose of the `pubspec.yaml` file in a Flutter project?',
      'answers': [
        {
          'text': 'To define the project name only',
          'score': 0,
        },
        {
          'text': 'To configure project dependencies and metadata',
          'score': 1,
        },
        {
          'text': 'To store UI layout information',
          'score': 0,
        },
        {
          'text': 'To manage authentication settings',
          'score': 0,
        },
      ],
    },
    {
      'questionText': 'What is the hot reload feature in Flutter?',
      'answers': [
        {
          'text': 'It warms up your computer',
          'score': 0,
        },
        {
          'text': 'It quickly applies code changes to a running app',
          'score': 1,
        },
        {
          'text': 'It optimizes the app for performance',
          'score': 0,
        },
        {
          'text': 'It generates random code snippets',
          'score': 0,
        },
      ],
    },
    {
      'questionText':
          'Which widget is used to create a scrollable list of widgets in Flutter?',
      'answers': [
        {
          'text': 'ListView',
          'score': 1,
        },
        {
          'text': 'GridView',
          'score': 0,
        },
        {
          'text': 'Column',
          'score': 0,
        },
        {
          'text': 'Row',
          'score': 0,
        },
      ],
    },
    {
      'questionText': 'What does the `setState` method do in Flutter?',
      'answers': [
        {
          'text': 'It sets the state of the entire app',
          'score': 0,
        },
        {
          'text':
              'It triggers a rebuild of the widget tree with the updated state',
          'score': 1,
        },
        {
          'text': 'It resets the app to its initial state',
          'score': 0,
        },
        {
          'text': 'It sets the state for a specific widget only',
          'score': 0,
        },
      ],
    },
  ];

  int questionIndex = 0;
  int totalScore = 0;
  int _selectedAnswerIndex = -1;

  void _answerQuestion(int score) {
    setState(() {
      totalScore += score;
      // questionIndex++;
    });

    if (questionIndex < questions.length) {
    } else {}
  }

  void _nextQuestion() {
    setState(() {
      questionIndex++;
    });

    if (questionIndex < questions.length) {
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Quiz App'),
        backgroundColor: Colors.orange,
        centerTitle: false,
      ),
      body: questionIndex < questions.length
          ? Column(
              children: [
                Text(
                  "Question ${questionIndex + 1} / ${questions.length}",
                  style: const TextStyle(fontSize: 16),
                ),
                Quiz(
                  questionText:
                      questions[questionIndex]['questionText'] as String,
                  answers: questions[questionIndex]['answers']
                      as List<Map<String, Object>>,
                  answerQuestion: _answerQuestion,
                  selectedAnswerIndex: _selectedAnswerIndex,
                ),
              ],
            )
          : QuizResult(totalScore: totalScore, resetQuiz: _resetQuiz),
      floatingActionButton: FloatingActionButton(
        onPressed: _nextQuestion,
        child: const Icon(Icons.arrow_forward),
      ),
    );
  }

  void _resetQuiz() {
    setState(() {
      questionIndex = 0;
      totalScore = 0;
    });
  }
}

class Quiz extends StatelessWidget {
  final String questionText;
  final List<Map<String, Object>> answers;
  final Function(int) answerQuestion;
  final int selectedAnswerIndex;

  const Quiz({
    super.key,
    required this.questionText,
    required this.answers,
    required this.answerQuestion,
    required this.selectedAnswerIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(questionText),
        ...(answers.asMap().entries.map((entry) {
          final index = entry.key;
          final answer = entry.value;
          return Answer(
            () => answerQuestion(answer['score'] as int),
            answer['text'] as String,
            selectedAnswerIndex == index,
            answer['score']==1,
          );
        }).toList()),
      ],
    );
  }
}

class Question extends StatelessWidget {
  final String questionText;

  const Question(this.questionText);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Text(
        questionText,
        style: const TextStyle(fontSize: 18),
        textAlign: TextAlign.center,
      ),
    );
  }
}

class Answer extends StatelessWidget {
   final VoidCallback selectHandler;
   final String answerText;
   final bool isSelected;
   final bool isCorrect;

  const Answer(
    this.selectHandler,
    this.answerText,
    this.isSelected,
    this.isCorrect,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: ElevatedButton(
        onPressed: selectHandler,
        style: ElevatedButton.styleFrom(
          primary:
               isSelected
                  ? isCorrect
                      ? Colors.green
                      : Colors.red
                  : Colors.amber,
        ),
        child: Text(answerText),
      ),
    );
  }
}

class QuizResult extends StatelessWidget {
  final int totalScore;
  final VoidCallback resetQuiz;

  const QuizResult(
      {super.key, required this.totalScore, required this.resetQuiz});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Quiz Completed!',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Text(
              'Your Score: $totalScore',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: resetQuiz,
              child: const Text('Restart Quiz'),
            ),
          ],
        )
      ],
    );
  }
}
