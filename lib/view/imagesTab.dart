import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';

class imagestab extends StatelessWidget {
  final String imageAsset = 'assets/images/flutter.png';
  final String imageAsset1 = 'assets/images/nature.jpg';

  const imagestab({super.key});

  @override
  Widget build(BuildContext context) =>
      Scaffold(
        backgroundColor: Colors.deepPurpleAccent,
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/images/background.png'),
                  fit: BoxFit.cover
              )
          ),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(50),
            child: Column(
              children: [
                Image.asset(imageAsset),
                shareButton( 'Share Image from Assets',
                      () async {
                       final image = await rootBundle.load(imageAsset);
                       final buffer = image.buffer;
                       Share.shareXFiles([
                         XFile.fromData(buffer.asUint8List(
                           image.offsetInBytes,
                           image.lengthInBytes,
                         ),
                           name: 'Flutter Logo',
                           mimeType: 'flutter.png',
                         ),
                       ]);}
                ),
                Image.asset(imageAsset1),
                shareButton( 'Share Image from Assets',
                        () async {
                      final image = await rootBundle.load(imageAsset1);
                      final buffer = image.buffer;
                      Share.shareXFiles([
                        XFile.fromData(buffer.asUint8List(
                          image.offsetInBytes,
                          image.lengthInBytes,
                        ),
                          name: 'Nature',
                          mimeType: 'nature.jpg',
                        ),
                      ]);
                    }
                ),
              ],
            ),
          ),
        ),
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

