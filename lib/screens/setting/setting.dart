import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('FAQ'),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Card(
                  elevation: 10,
                  color: Colors.grey.shade300,
                  child: const ExpansionTile(
                    childrenPadding: EdgeInsets.only(left: 5),
                    backgroundColor: Color.fromARGB(255, 0, 30, 57),
                    collapsedBackgroundColor: Color.fromARGB(176, 0, 30, 57),
                    title: Text(
                      'Question 1.',
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins',
                          color: Colors.white),
                    ),
                    subtitle: Text(
                      'What is workConnect and how does it work?',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Poppins',
                          color: Colors.white),
                    ),
                    children: [
                      ListTile(
                        title: Text(
                          'WorkConnect is a platform designed to connect skilled workers and employers using a mobile application that runs on Android, IOS, the web.\n\n It enables users to find and hire skilled worker or get job opportunities with ease.\n\nSkilled workers can showcase their skill and connect with potential employers through this platform.',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Poppins',
                              fontSize: 18,
                              fontWeight: FontWeight.w400),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 2,
                ),
                Card(
                  elevation: 10,
                  color: Colors.grey.shade300,
                  child: const ExpansionTile(
                    childrenPadding: EdgeInsets.only(left: 5),
                    backgroundColor: Color.fromARGB(255, 0, 30, 57),
                    collapsedBackgroundColor: Color.fromARGB(176, 0, 30, 57),
                    title: Text(
                      'Question 2.',
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins',
                          color: Colors.white),
                    ),
                    subtitle: Text(
                      'What problems does WorkConnect aim to solve?',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Poppins',
                          color: Colors.white),
                    ),
                    children: [
                      ListTile(
                        title: Text(
                          'WorkConnect addresses the challenges of finding trusted skilled worker and artisans for various tasks.\n\n1. It eliminates the need for relying on referrals or recommendations.\n2. Reduces the risk of dissatisfaction.\n3. It minimizes the potential for conflicts between employer and workers.\n4. It also save time by facilitating quick access to skilled professional.',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Poppins',
                              fontSize: 18,
                              fontWeight: FontWeight.w400),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 2,
                ),
                Card(
                  elevation: 10,
                  color: Colors.grey.shade300,
                  child: const ExpansionTile(
                    childrenPadding: EdgeInsets.only(left: 5),
                    backgroundColor: Color.fromARGB(255, 0, 30, 57),
                    collapsedBackgroundColor: Color.fromARGB(176, 0, 30, 57),
                    title: Text(
                      'Question 3.',
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins',
                          color: Colors.white),
                    ),
                    subtitle: Text(
                      'Who can use the WorkConnect application?',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Poppins',
                          color: Colors.white),
                    ),
                    children: [
                      ListTile(
                        title: Text(
                          'WorkConnect is open to anyone with a smart device and internet access. Skilled worker looking for job opportunities and employers seeking skilled professional can both use the application to connect and collaborate.',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Poppins',
                              fontSize: 18,
                              fontWeight: FontWeight.w400),
                        ),
                      )
                    ],
                  ),
                ),
                // TextButton(
                //             onPressed: () {
                //               FirebaseAuth.instance.signOut();
                //             },
                //             child: const Text(
                //               'LogOut',
                //               style: TextStyle(
                //                   color: Colors.orange,
                //                   fontSize: 18,
                //                   fontWeight: FontWeight.bold),
                //             ),
                //           ),
              ],
            ),
          ),
        ));
  }
}
