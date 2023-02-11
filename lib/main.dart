import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor:Colors.amber, 
      ),
      debugShowCheckedModeBanner: false,
      home: _RatingApp(),
    );
  }
}

class _RatingApp extends StatefulWidget {
  @override
  State<_RatingApp> createState() => __RatingAppState();
}

class __RatingAppState extends State<_RatingApp> {
  // double rating = 1;
  int currentIndex = 0;
  List lisofcolor = [
    Container(
      color: Colors.purpleAccent,
    ),
    Container(
      color: Colors.pinkAccent,
    ),
    Container(
      color: Colors.greenAccent,
    ),
    Container(
      color: Colors.blueAccent,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text(
          "Customer Feedback",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: lisofcolor[currentIndex],
      bottomNavigationBar: BottomNavyBar(
        backgroundColor: Colors.white,
        animationDuration: const Duration(milliseconds: 170),
        curve: Curves.easeInOutCirc,
        selectedIndex: currentIndex,
        onItemSelected: (index) {
          setState(
            () {
              currentIndex = index;
            },
          );
        },
        items: [
          BottomNavyBarItem(
            icon: const Icon(Icons.home),
            title: const Text('Home'),
            activeColor: Colors.purpleAccent,
            inactiveColor: Colors.black,
          ),
          BottomNavyBarItem(
            icon: const Icon(Icons.message),
            title: const Text('Chat'),
            activeColor: Colors.pinkAccent,
            inactiveColor: Colors.black,
          ),
          BottomNavyBarItem(
            icon: const Icon(Icons.phone),
            title: const Text('Call'),
            activeColor: Colors.greenAccent,
            inactiveColor: Colors.black,
          ),
          BottomNavyBarItem(
            icon: const Icon(Icons.feedback),
            title: const Text('Feedback'),
            activeColor: Colors.indigo,
            inactiveColor: Colors.black,
          ),
        ],
      ),
    );
  }
}
