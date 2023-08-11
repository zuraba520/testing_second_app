import 'package:flutter/material.dart';
import 'package:testing_second_app/start_screen.dart';
import 'package:testing_second_app/questions_screen.dart';
import 'data/questions.dart';
import 'package:testing_second_app/data/questions.dart';
import 'package:testing_second_app/result_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers =
      []; // final imitom rom ar vapireb cvladis xelaxla minichebas anu selectedAnswerisas
  var activeScreen = 'start-screen';

  //es aris gadartvis ekranis funqcia
  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
//mokled aq is xdeba ro  roca morcheba es kitxvebi red errori ar amoagdos da isev sawyisi pagedan daiwyos
    if (selectedAnswers.length == questions.length) {
      setState(() {
        //selectedAnswers = []; //shecdomis asacileblad,radganac axla ar viwyebt arafers unda shevanacvlod da vanaxot shedegebis ekrani
        //selectedAnswers = []; //shecdomis asacileblad,radganac axla ar viwyebt arafers unda shevanacvlod da vanaxot shedegebis ekrani
        activeScreen = 'results-screen';
      });
    }
  }

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(
        onSelectAnswer: chooseAnswer,
      );
    }
    if (activeScreen == 'results-screen') {
      screenWidget = ResultsScreen(
        chosenAnswers: selectedAnswers,
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                // ფერების მინიჭება
                Color.fromARGB(255, 98, 224, 169),
                Color.fromARGB(255, 252, 189, 0),
              ], // ფერების  აჯაფსანდალი
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
