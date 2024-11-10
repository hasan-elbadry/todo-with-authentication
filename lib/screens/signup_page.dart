import 'package:flutter/material.dart';
import 'package:todo_with_authentcation/screens/signin_page.dart';

import '../widgets/text_form_custom.dart';

class SignUp extends StatelessWidget {
  SignUp({super.key});

  static const route = '/signup';
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.person,
                  size: 40,
                )),
          )
        ],
        title: const Text(
          'Signup',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          width: double.infinity,
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Create your account',
                  style: TextStyle(
                    color: Colors.black38,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                textFieldCustom('Username', Icons.person, false),
                textFieldCustom('Email', Icons.email, false),
                textFieldCustom('Password', Icons.password, true),
                textFieldCustom('Confirm Password', Icons.password, true),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: ElevatedButton(
                    onPressed: () {
                      if(formKey.currentState!.validate()){
                        print('success');
                      }
                    },
                    style: const ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(Colors.blue),
                        padding: WidgetStatePropertyAll(
                            EdgeInsets.symmetric(horizontal: 120, vertical: 15)),
                        foregroundColor: WidgetStatePropertyAll(Colors.white)),
                    child: const Text(
                      'Signup',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).popAndPushNamed(SignIn.route);
                    },
                    style: const ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(Colors.white),
                        padding: WidgetStatePropertyAll(
                            EdgeInsets.symmetric(horizontal: 120, vertical: 15)),
                      foregroundColor: WidgetStatePropertyAll(Colors.blue),
                    ),
                    child: const Text(
                      'signin',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
