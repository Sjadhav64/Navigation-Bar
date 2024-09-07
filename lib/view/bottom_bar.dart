import 'package:flutter/material.dart';
import 'package:navigation_bar/view/imagesTab.dart';
import 'package:navigation_bar/view/textTab.dart';
import 'package:navigation_bar/view/videoTab.dart';


class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int currentIndexValue = 0;
  List screenList=[
    const textTab(),
    const videoTab(),
    const imagestab(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        centerTitle: true,
        title: Text('Navigation Bar',
          style:TextStyle(color:Colors.white, fontWeight: FontWeight.w500),),),
    body: screenList[currentIndexValue],
    bottomNavigationBar: BottomNavigationBar(
    iconSize: 30,
    backgroundColor: Colors.deepPurpleAccent,
    showUnselectedLabels: false,
    selectedItemColor: Colors.white,
    unselectedItemColor: Colors.black,
    onTap: (index) {
    setState(() {
    currentIndexValue = index;
    });
    },
    currentIndex: currentIndexValue,
    items: const [
    BottomNavigationBarItem(
    icon: Icon(Icons.text_format),
    label: 'Text',
    ),
    BottomNavigationBarItem(
    icon: Icon(Icons.video_collection),
    label: 'Video',
    ),
    BottomNavigationBarItem(
    icon: Icon(Icons.image),
    label: 'Image',
    ),],
    ),
    );
  }
}

