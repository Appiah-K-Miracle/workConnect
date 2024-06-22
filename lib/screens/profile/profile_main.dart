import 'package:flutter/material.dart';
 
import 'package:workconnect/screens/profile/profile.dart';

class ProfileMain extends StatelessWidget {
  const ProfileMain({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: const SafeArea(
        child: ProfileInfo()
      ),
    );
  }
}
