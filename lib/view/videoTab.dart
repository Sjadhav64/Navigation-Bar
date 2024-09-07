import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';

class videoTab extends StatefulWidget {
  const videoTab({super.key});

  @override
  State<videoTab> createState() => _videoTabState();
}

class _videoTabState extends State<videoTab> {
  late VideoPlayerController _videoPlayerController;
  late ChewieController _chewieController;


  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.networkUrl(Uri.parse(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'));
    _chewieController = ChewieController(
        videoPlayerController: _videoPlayerController,
    allowMuting: true,
    looping: true
    );
  }
  @override
  Widget build(BuildContext context) =>
      Scaffold(
        body: Center(
            child: Chewie(controller: _chewieController)),
      );
  void dipose(){
    super.dispose();
    _videoPlayerController.dispose();
    _chewieController.dispose();
  }
  shareButton(String title, Function()? onPressed){
    return Container(
      width: double.infinity,
      height: 50,
      margin: const EdgeInsets.symmetric(vertical: 30),

      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(Colors.grey),
        ),
        onPressed: onPressed,
        child: Text(title, style: const TextStyle(fontSize: 20 , color: Colors.black), ),
      ),
    );
    }
}