import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_with_authentcation/providers/todo_provider.dart';
import 'package:todo_with_authentcation/screens/signin_page.dart';
import 'package:todo_with_authentcation/screens/todo_page.dart';

import 'screens/signup_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => todoProvider(),
      builder: (context, child) => MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: SignUp.route,
        routes: {
          SignUp.route: (context) => const SignUp(),
          SignIn.route: (context) => const SignIn(),
          TodoPage.route: (context) => ChangeNotifierProvider(
              create: (context) => todoProvider(),
              builder: (context, child) => const TodoPage())
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
