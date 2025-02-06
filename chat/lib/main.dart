import 'package:chat/chat_page.dart';
import 'package:chat/utils/brand_color.dart';
import 'package:flutter/material.dart';
import 'login_page.dart';

void main() {
  runApp(ChatApp());
}

class ChatApp extends StatelessWidget {
  const ChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Chat App",
      theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          appBarTheme: AppBarTheme(
              backgroundColor: Colors.blue, foregroundColor: Colors.black)),
      // home: CounterStateful(buttonColor: Colors.blue)
      home: LoginPage(),
      routes: {'/chat': (context) => ChatPage()},
    );
  }
}
