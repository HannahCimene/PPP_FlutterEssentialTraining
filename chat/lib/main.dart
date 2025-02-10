import 'package:chat/chat_page.dart';
import 'package:chat/services/auth_service.dart';
import 'package:chat/utils/brand_color.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'login_page.dart';

void main() {
  runApp(Provider(create: (BuildContext context) { return AuthService(); },
  child: ChatApp()));
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
