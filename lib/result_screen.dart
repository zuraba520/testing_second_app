import 'package:flutter/material.dart';
import 'package:testing_second_app/data/questions.dart';
import 'package:testing_second_app/questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    super.key,
    required this.chosenAnswers,
  });

  final List<String> chosenAnswers;

  List<Map<String, Object>> getSummeryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      // loop body
      summary.add(
        // es aris bolo gverdi pasuxebis swori da misi chamonatvali
        {
          'question_index': i,
          'question': questions[i].text,
          'correct_answers': questions[i].answers[0],
          'user_answer': chosenAnswers[i]
        },
      );
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummeryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;//gasafiltrad gamoiyeneba

    return SizedBox(
      width: double.infinity, // rom gaiwelos mtlian ekranze fyvelaferi
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('you answered $numCorrectQuestions out of $numTotalQuestions questions correctly!'),
            const SizedBox(
              height: 30,
            ),
            QuestionsSummary(summaryData),
            const SizedBox(
              height: 30,
            ),
            TextButton(
              onPressed: () {},
              child: const Text('Restart Quiz!'),
            )
          ],
        ),
      ),
    );
  }
}
