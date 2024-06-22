import 'package:flutter/material.dart';
import 'package:workconnect/screens/login_screens/signin.dart';

import '../screens/login_screens/signup.dart';


class SignupOrSignin extends StatefulWidget {
  const SignupOrSignin({super.key});

  @override
  State<SignupOrSignin> createState() => _SignupOrSigninState();
}

class _SignupOrSigninState extends State<SignupOrSignin> {
  bool showSigninPage = true;

  void togglePage(){
    setState(() {
      showSigninPage = !showSigninPage;
    });
  }
  @override
  Widget build(BuildContext context) {
    if (showSigninPage){
      return LoginPage(onTap: togglePage);
    }else{
      return SignUpPage(onTap: togglePage);
    }
  }
}