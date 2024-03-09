import 'package:app/prefs/loginPreference.dart';
import 'package:app/screens/first-page.dart';
import 'package:app/screens/welcome.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => defaultt(),
        )
      ],
      child: Consumer<defaultt>(
        builder: (context, value, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: (value.islogin && value.isUser) ? first() : welcome(),
          );
        },
      ),
    );
  }
}
