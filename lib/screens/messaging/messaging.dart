import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:workconnect/screens/messaging/chat_message.dart';
import 'package:workconnect/screens/messaging/new_messge.dart';

class Messaging extends StatefulWidget {
  const Messaging({super.key});

  @override
  State<Messaging> createState() => _MessagingState();
}

class _MessagingState extends State<Messaging> {
  final user = FirebaseAuth.instance.currentUser!;
  void setupPushNotifications() async {
    final fcm = FirebaseMessaging.instance;

    await fcm.requestPermission();
    fcm.subscribeToTopic('chat');

    // await FirebaseFirestore.instance
    //     .collection('user_token')
    //     .doc(user.uid)
    //     .set({
    //   'user_token': token,
    // });
  }

  @override
  void initState() {
    super.initState();

    setupPushNotifications();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: const Column(
        children: [
          Expanded(
            child: ChatMessages(),
          ),
          NewMessages()
        ],
      ),
    );
  }
}
