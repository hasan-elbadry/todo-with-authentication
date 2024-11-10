import 'package:flutter/material.dart';

Widget textFieldCustom(String name, IconData icon, bool isPassword) {
  return Column(
    children: [
      const SizedBox(height: 10),
      TextFormField(
        obscureText: isPassword,
        style: const TextStyle(
          color: Colors.black38,
        ),
        decoration: InputDecoration(
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 7),
            child: Icon(
              icon,
              size: 25,
              color: Colors.black38,
            ),
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 20),
          label: Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Text(
              name,
              style: const TextStyle(
                  color: Colors.black,
                fontSize: 17,
                fontWeight: FontWeight.bold
              )
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: const BorderSide(
              color: Colors.transparent,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: const BorderSide(
              color: Colors.transparent,
            ),
          ),
          fillColor: Colors.black12,
          filled: true,
        ),
      ),
      const SizedBox(height: 10),
    ],
  );
}
