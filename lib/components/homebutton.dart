import 'package:flutter/material.dart';

class HomeButton extends StatelessWidget {
  const HomeButton(
      {super.key, required this.iconImagePath, required this.buttonText});

  final String iconImagePath;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          height: 80,
          decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade400,
                  blurRadius: 0.5,
                  spreadRadius: 0.1,
                ),
              ]
              ),
          child: Image.asset(
            iconImagePath,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          buttonText,
          style: TextStyle(
            color: Colors.grey.shade400,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
