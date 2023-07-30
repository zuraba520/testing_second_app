import 'package:flutter/material.dart';
import 'package:testing_second_app/start_screen.dart';
import 'package:testing_second_app/questions_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  //nulovani radganac aris tavdapirvelad kitxvis nishani magito davamate

  var activeScreen = 'start-screen';

  //es aris gadartvis ekranis funqcia
  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == 'questions-screen') {
      screenWidget = const QuestionsScreen();
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
