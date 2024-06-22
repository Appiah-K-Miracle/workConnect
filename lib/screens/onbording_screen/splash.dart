import 'package:flutter/material.dart';

class LoadScreen extends StatelessWidget {
  const LoadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,

      body: const  Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}