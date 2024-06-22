import 'package:flutter/material.dart';
 
// ignore: must_be_immutable
class SignUpButton extends StatelessWidget {
  SignUpButton({super.key, required this.onTap});

  Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(25),
        margin: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Center(
          child: Text(
            'Sign Up',
            style: TextStyle(color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
