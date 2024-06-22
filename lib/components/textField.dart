import 'package:flutter/material.dart';

class TextFields extends StatelessWidget {
  const TextFields({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
    
  });

  final controller;
  final String hintText;
  final bool obscureText;
  

  

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Form(
        child: TextFormField(
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color.fromRGBO(255, 255, 255, 0.559),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade400),
              ),
              fillColor: const Color.fromARGB(186, 238, 238, 238),
              filled: true,
              hintText: hintText,
              hintStyle: TextStyle(color: Colors.grey.shade500)),
           
        ),
      ),
    );
  }
}
