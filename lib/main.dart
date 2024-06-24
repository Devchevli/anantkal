import 'package:assignment/SharedPerfrenceService.dart';
import 'package:assignment/chatScreen.dart';
import 'package:assignment/emoji.dart';
import 'package:assignment/signUp.dart';
import 'package:assignment/signup_screen.dart';
import 'package:flutter/material.dart';


void main() async{
  // await SharedPrefService.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      // home: ChatScreen(),
      home: ChatScreen(),
    );
  }
}


int userId = 0;
String name = '';