import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class textTab extends StatelessWidget {
  const textTab({super.key});
  final String text = 'Flutter is a framework to build cross application.https://flutter.dev';

  @override
  Widget build(BuildContext context) =>
      Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/images/background.png'),
                  fit: BoxFit.cover
              )
          ),
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(50),
              child: Column(
                children: [
                  shareButton('Flutter Share Text & Link',() {
                    Share.share(text);
                  }),
                ],
              ),
            ),
          ),
        )
      );

  shareButton(String title, Function()? onPressed){
    return Container(
      width: double.infinity,
      height: 50,
      margin: const EdgeInsets.symmetric(vertical: 30),

      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(Colors.deepPurpleAccent),
        ),
          onPressed: onPressed,
          child: Text(title, style: const TextStyle(fontSize: 20 , color: Colors.black), ),
      ),
    );
  }
}