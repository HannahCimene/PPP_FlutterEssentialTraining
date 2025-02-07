import 'package:chat/chat_page.dart';
import 'package:chat/utils/spaces.dart';
import 'package:chat/utils/textfield_styles.dart';
import 'package:chat/widgets/login_text_field.dart';
import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final _formkey = GlobalKey<FormState>();

  void loginUser(context) {
    if (_formkey.currentState != null && _formkey.currentState!.validate()) {
      print(userNameController.text);
      print(passwordController.text);

      Navigator.pushReplacementNamed(context, '/chat',
          arguments: '${userNameController.text}');

      print('Login succesful!');
    } else {
      print('Not succesful!');
    }
  }

  final userNameController = TextEditingController();
  final passwordController = TextEditingController();

  final _mainUrl = "https://poojabhaumik.com";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Let\'s sign you in!',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5),
            ),
            Text(
              'Welcome back! \n You\'ve been missed!',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.blueAccent,
                  fontSize: 20),
            ),

            verticalSpacing(24),

            Container(
              height: 200,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fitWidth,
                      image: AssetImage('assets/illustration.png')),
                  borderRadius: BorderRadius.circular(24)),
            ),

            verticalSpacing(24),

            Form(
              key: _formkey,
              child: Column(
                children: [
                  LoginTextField(
                    hintText: "Enter your username",
                    validator: (value) {
                      if (value != null &&
                          value.isNotEmpty &&
                          value.length < 5) {
                        return 'Your username should be more than 5 characters';
                      } else if (value != null && value.isEmpty) {
                        return 'Please type your username';
                      }
                      return null;
                    },
                    controller: userNameController,
                  ),
                  verticalSpacing(24),
                  LoginTextField(
                    hasAsterisks: true,
                    controller: passwordController,
                    hintText: 'Enter your password',
                  ),
                ],
              ),
            ),
            verticalSpacing(24),
            ElevatedButton(
                onPressed: () {
                  loginUser(context);
                },
                child: Text(
                  'Login',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w300),
                )),
            // OutlinedButton(onPressed: () {}, child: FlutterLogo()),
            InkWell(
              splashColor: Colors.red,
              onDoubleTap: () {
                print('Double tapped');
              },
              onLongPress: () {
                print('On long press');
              },
              onTap: () async {
                //todo: Navigate to browser
                print('Link clicked!');
                // if (!await launch(_mainUrl)) {
                //   throw Exception('Could not launch');}
              },
              child: Column(
                children: [
                  Text('Find us on'),
                  Text(_mainUrl),
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
