import 'package:flutter/material.dart';
import 'package:testing_second_app/answer_button.dart';
import 'package:testing_second_app/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({
    super.key,
    required this.onSelectAnswer,
  });

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() {
    return _QuiestionsScreenState();
  }
}

class _QuiestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);

    //currentQuestionIndex = currentQuestionIndex + 1; //igivea rac qvevit +=
    setState(() {
      currentQuestionIndex += 1; // roca vawkapunebt mashin sruldeba
    });
    //currentQuestionIndex ++; /es ertit zrdis mnishvnelobas
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[currentQuestionIndex];
    return SizedBox(
      width: double.infinity, // rom gaiwelos mtlian ekranze fyvelaferi
      child: Container(
        margin: const EdgeInsets.all(40),
        // tavis formaze moyavs kitxvebi dzan gawelili roar iyos
        child: Column(
          // morgebuli iyos es pasuxebi centrshi
          mainAxisAlignment: MainAxisAlignment.center,
          // centrshi ro gadavides kitxvebis chamonatvali
          crossAxisAlignment: CrossAxisAlignment.stretch,
          //ro gaichimoos
          children: [
            Text(
              // es aris kitxvistvis pasuxebamde didad ro chandes da davaimprotet zevidan googlefonts
              currentQuestion.text,
              style: GoogleFonts.lato(
                color: Colors.white70,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign:
                  TextAlign.center, // zevit magla teqstis centrshi gadayvana
            ),
            const SizedBox(height: 30),
            //3 dot i anu satitaod roar chamovwerot kitxvebi magistvis + arevistvis shuffle aqve da quiz shi modelshi aris shuffles gagrdzeleba ritic aq davakavshiret
            ...currentQuestion.getShuffledAnswers().map((answer) {
              return AnswerButton(
                answerText: answer,
                onTap: () {
                  answerQuestion(answer); // mxolod mashin mushaobs roca answerbutton amushavdeba manamde ara
                },
              );
            })
          ],
        ),
      ),
    );
  }
}
