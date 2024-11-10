import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_with_authentcation/providers/signin_provider.dart';
import 'package:todo_with_authentcation/screens/signup_page.dart';
import 'package:todo_with_authentcation/screens/todo_page.dart';

class SignIn extends StatelessWidget {
  SignIn({super.key});

  static const route = '/signin';
  var keyForm = GlobalKey<FormState>();
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
          'SignIn',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: keyForm,
          child: Column(
            children: [
              const Center(
                  child: Padding(
                padding: EdgeInsets.only(top: 30),
                child: Text(
                  "Welcome Back",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                      color: Colors.black),
                ),
              )),
              const Text(
                "Enter your credential to longin",
                style: TextStyle(fontSize: 15, color: Colors.grey),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 140, left: 15, right: 15),
                child: Consumer<SigninProvider>(
                  builder: (context, provider, child) => TextFormField(
                    validator: (value) {
                      if( !(value == null || value.isEmpty) ){
                        if(value.length>3){
                          return null;
                        }
                        return 'length of username or password must be more than 3';
                      }
                      return 'invalid username or password';
                    },
                    controller: provider.username,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.person, color: Colors.grey),
                      hintText: 'Username',
                      filled: true,
                      fillColor: const Color(0xFFF3E5F5),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
                child: Consumer<SigninProvider>(
                  builder: (context, provider, child) => TextFormField(
                    validator: (value) {
                      if( !(value == null || value.isEmpty) ){
                        if(value.length>3){
                          return null;
                        }
                        return 'length of username or password must be more than 3';
                      }
                      return 'invalid username or password';
                    },
                    controller: provider.password,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.password, color: Colors.grey),
                      hintText: 'Password',
                      filled: true,
                      fillColor: const Color(0xFFF3E5F5),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                child: SizedBox(
                  height: 50.0,
                  width: 430.0,
                  child: Consumer<SigninProvider>(
                    builder: (context, provider, child) => FloatingActionButton(
                      onPressed: () {
                        if(keyForm.currentState!.validate()){
                          Navigator.of(context).pushNamed(TodoPage.route,
                              arguments: provider.username.text);
                        }
                      },
                      backgroundColor: const Color(0xff9c28b1),
                      child: const Text(
                        "Login",
                        style: TextStyle(fontSize: 17, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 70),
                child: TextButton(
                  onPressed: () {},
                  child: const Text("Forget Password"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 70),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account?"),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).popAndPushNamed(SignUp.route);
                      },
                      child: const Text("SignUp"),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
