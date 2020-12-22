import 'package:Medwise/screens/auth_page.dart';
import 'package:Medwise/widgets/auth_form.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import './screens/home_page.dart';

// ignore: unused_import
import './widgets/task_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Medwise',
        theme: ThemeData(
          primaryColor: Color.fromRGBO(41, 98, 255, 1),
          accentColor: Colors.green,
          textTheme: ThemeData.light().textTheme.copyWith(
                headline6: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(41, 98, 255, 1),
                ),
                subtitle1: TextStyle(
                  fontSize: 16,
                  color: Color.fromRGBO(67, 67, 67, 1),
                ),
                subtitle2: TextStyle(
                  fontSize: 16,
                  color: Color.fromRGBO(67, 67, 67, 0.8),
                ),
                button: TextStyle(
                  color: Colors.white,
                ),
              ),
          appBarTheme: AppBarTheme(
            textTheme: ThemeData.light().textTheme.copyWith(
                  headline6: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
          ),
        ),
        home: StreamBuilder(
          stream: FirebaseAuth.instance.onAuthStateChanged,
          builder: (context, userSnapshot) {
            if (userSnapshot.hasData) {
              print(userSnapshot);
              return HomePage();
            }
            return AuthScreen();
          },
        ));
  }
}
