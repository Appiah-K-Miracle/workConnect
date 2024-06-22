import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workconnect/screens/onbording_screen/splash.dart';

import 'firebase_options.dart';

import 'package:workconnect/screens/homepage/homepage.dart';

import 'package:workconnect/screens/onbording_screen/onboarding_screen.dart';

import 'package:workconnect/themes/darktheme.dart';
import 'package:workconnect/themes/lighttheme.dart';

import 'auth/signup_or_signin.dart';

bool? seenOnboard;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
// to load onboard for the first time only
  SharedPreferences pref = await SharedPreferences.getInstance();
  seenOnboard = pref.getBool('seenOnboard') ?? true; //if null set to false
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: ThemeMode.system,
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (ctx, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const LoadScreen();
            }

            if (snapshot.hasData) {
              return const HomePage();
            }
            return seenOnboard == true
                ? const SignupOrSignin()
                : const OnBoardingScreen();
          },
        ));
  }
}
