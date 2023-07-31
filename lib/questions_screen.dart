import 'package:flutter/material.dart';
import 'package:testing_second_app/answer_button.dart';
import 'package:testing_second_app/data/questions.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});

  @override
  State<QuestionsScreen> createState() {
    return _QuiestionsScreenState();
  }
}

class _QuiestionsScreenState extends State<QuestionsScreen> {
  @override
  Widget build(context) {
    final currentQuestion = questions[0];
    return SizedBox(
      width: double.infinity, // rom gaiwelos mtlian ekranze fyvelaferi
      child: Column(
        // morgebuli iyos es pasuxebi centrshi
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
           Text(
            currentQuestion.text,
            style: const TextStyle(
              color: Colors.white70,
            ),
          ),
          const SizedBox(height: 30),
          AnswerButton(
            answerText: currentQuestion.answers[0],
            onTap: () {},
          ),
          AnswerButton(
            answerText: currentQuestion.answers[1],
            onTap: () {},
          ),
          AnswerButton(
            answerText: currentQuestion.answers[2],
            onTap: () {},
          ),
          AnswerButton(
            answerText: currentQuestion.answers[3],
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
