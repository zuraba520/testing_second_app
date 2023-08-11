import 'package:flutter/material.dart';
class StartScreen extends StatelessWidget {
  const StartScreen( this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset( // ფოტოს ჩასმა ლოგოსი ანუ
            'assets/images/quiz-logo.png',
            width: 300,
            color: Colors.white70,
          ),
          const SizedBox(height: 80),
          const Text( // es  aris mtavari gverdi iswavle flateri gasartobi gzita
            'Learn Flutter the fun way!',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
          const SizedBox(height: 30),
          OutlinedButton.icon(
            onPressed: startQuiz,
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
            ),
            //აიქონის დამატება ღილაკშივე,ანუ შიგნით
            icon: const Icon(Icons.arrow_right_alt),
            label: const Text('start quiz'),
          )
        ],
      ),
    );
  }
}
