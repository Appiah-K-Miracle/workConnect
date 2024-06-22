import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class IntroPage3 extends StatelessWidget {
  const IntroPage3({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
                'assets/introImage/intro4.json',
                width: 600,
                height: 300,
                fit: BoxFit.fill,
              ),
              Container(
                // alignment: const Alignment( 0.5),
                padding: const EdgeInsets.symmetric(
                    horizontal: 26.0, vertical: 40.0),
                child: const Text(
                  'We Provide the Best Cleaners For Your Home and Offices',
                  style:  TextStyle(
                    fontSize: 45,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500
                  )
                ),
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
