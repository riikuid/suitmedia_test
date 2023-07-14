import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suitmedia_test/pages/first_page.dart';
import 'package:suitmedia_test/pages/second_page.dart';
import 'package:suitmedia_test/pages/third_page.dart';
import 'package:suitmedia_test/provider/user_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UserProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        routes: {
          '/third': (context) => ThirdPage(),
        },
        home: const FirstPage(),
      ),
    );
  }
}
