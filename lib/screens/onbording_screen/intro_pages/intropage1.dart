import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';

class IntroPage1 extends StatelessWidget {
  const IntroPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text(
                'Welcome to WorkConnect',
                style: TextStyle(
                
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),

              Lottie.asset(
                'assets/introImage/intro1.json',
                width: 400,
                height: 400,
                fit: BoxFit.fill,
              ),
              Container(
                alignment: const Alignment(0.5, 0.5),
                padding: const EdgeInsets.symmetric(
                    horizontal: 26.0, vertical: 40.0),
                child: const Text('Get Your Task Done With Just A Few Taps',
                    style: TextStyle(
                        fontSize: 50,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500)),
              ),

              // const SizedBox(
              //   height: 100,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
