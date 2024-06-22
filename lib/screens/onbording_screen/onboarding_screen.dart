import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
 
import 'package:workconnect/screens/onbording_screen/intro_pages/intropage1.dart';
import 'package:workconnect/screens/onbording_screen/intro_pages/intropage2.dart';
import 'package:workconnect/screens/onbording_screen/intro_pages/intropage3.dart';

import '../../auth/signup_or_signin.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _controller = PageController();

  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        PageView(
          controller: _controller,
          onPageChanged: (index) {
            setState(() {
              onLastPage = index == 2;
            });
          },
          children: const [
            IntroPage1(),
            IntroPage2(),
            IntroPage3(),
          ],
        ),
        Container(
            alignment: const Alignment(0, 0.95),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    _controller.jumpToPage(2);
                  },
                  child: const Text('Skip'),
                ),
                SmoothPageIndicator(controller: _controller, count: 3,
                effect:const SlideEffect(
                  dotColor:  Colors.grey,  
                   activeDotColor:  Colors.deepPurple,  
                ),
                ),
                onLastPage
                    ? GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context){
                                return const SignupOrSignin();
                              }
                            ),
                          );
                        },
                        child: const Text('Done'),
                      )
                    : GestureDetector(
                        onTap: () {
                          _controller.nextPage(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeIn);
                        },
                        child: const Text('Next'),
                      ),
              ],
            )),
      ]),
    );
  }
}
