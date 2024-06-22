import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:workconnect/screens/messaging/messaging.dart';

class ProfileInfo extends StatefulWidget {
  const ProfileInfo({super.key});

  @override
  State<ProfileInfo> createState() => _PopularCardState();
}

final currentUser = FirebaseAuth.instance;

class _PopularCardState extends State<ProfileInfo> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('users_more_info')
            .where('userId', isEqualTo: currentUser.currentUser!.uid)
            .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshopt) {
          List<Padding> clientWidgets = [];

          if (snapshopt.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (!snapshopt.hasData || snapshopt.data!.docs.isEmpty) {
            return const Center(
              child: Text('No messages found.'),
            );
          }
          if (snapshopt.hasError) {
            return const Center(
              child: Text('Something went Wrong...'),
            );
          }
          if (snapshopt.hasData) {
            final clients = snapshopt.data?.docs.reversed.toList();

            for (var client in clients!) {
              final clientWidget = Padding(
                padding: const EdgeInsets.symmetric(vertical: 50),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 50),
                        child: Text(
                          'My Profile',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Personal details',
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w300),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                'change',
                                style: TextStyle(
                                  color: Colors.orange.shade300,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w300,
                                  fontSize: 18,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 20),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Column(
                                      children: [
                                        Container(
                                            height: 80,
                                            width: 80,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(100),
                                                color: Colors.white),
                                            child: CircleAvatar(
                                              backgroundImage: NetworkImage(
                                                client['user_profile_picture'],
                                              ),
                                            )
                                            
                                           
                                            ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        GestureDetector(
                                          // change the picture of your profile
                                          onTap: () {},
                                          child: Text(
                                            'change photo',
                                            style: TextStyle(
                                                color: Theme.of(context)
                                                    .disabledColor,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w400,
                                                fontSize: 12),
                                          ),
                                        )
                                      ],
                                    ),
                                    IntrinsicWidth(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            client['user_name'],
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontFamily: 'Poppins',
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            client['user_email'],
                                            style: const TextStyle(
                                                color: Colors.white70,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w400,
                                                fontSize: 12),
                                          ),
                                          const Divider(
                                            thickness: 1,
                                            color: Colors.white70,
                                          ),
                                          Text(
                                            client['skill'],
                                            style: const TextStyle(
                                                color: Colors.white70,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w400,
                                                fontSize: 12),
                                          ),
                                          const Divider(
                                            thickness: 1,
                                            color: Colors.white70,
                                          ),
                                          Text(
                                            client['experience_year'],
                                            style: const TextStyle(
                                                color: Colors.white70,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w400,
                                                fontSize: 12),
                                          ),
                                          const Divider(
                                            thickness: 1,
                                            color: Colors.white70,
                                          ),
                                          Text(
                                            client['location'],
                                            style: const TextStyle(
                                                color: Colors.white70,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w400,
                                                fontSize: 12),
                                          ),
                                          const Divider(
                                            thickness: 1,
                                            color: Colors.white70,
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 50,
                            decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                borderRadius: BorderRadius.circular(0)),
                            child: TextButton.icon(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.phone_callback,
                                color: Colors.white70,
                              ),
                              label: const Text(''),
                            ),
                          ),
                          Container(
                            height: 50,
                            decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                borderRadius: BorderRadius.circular(0)),
                            child: TextButton.icon(
                              onPressed: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return const Messaging();
                                }));
                              },
                              icon: const Icon(
                                Icons.message,
                                color: Colors.white70,
                              ),
                              label: const Text(''),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            Card(
                              elevation: 5,
                              child: ExpansionTile(
                                backgroundColor: Theme.of(context).primaryColor,
                                collapsedBackgroundColor:
                                    Theme.of(context).primaryColor,
                                collapsedIconColor: Colors.orange,
                                title: const Text(
                                  'About Me',
                                  style: TextStyle(
                                      color: Colors.orange,
                                      fontFamily: 'Poppins',
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                ),
                                children: [
                                  ListTile(
                                    title: Text(client['about_user']),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'Pictures',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 200,
                              width: 150,
                              child: Image(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                  client['user_image1'],
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: 200,
                            width: 150,
                            child: Image(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                client['user_image2'],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          height: 50,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius: BorderRadius.circular(50)),
                          child: TextButton(
                            onPressed: () {
                              FirebaseAuth.instance.signOut();
                            },
                            child: const Text(
                              'LogOut',
                              style: TextStyle(
                                  color: Colors.orange,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
              clientWidgets.add(clientWidget);
            }
          }

          return ListView(
            shrinkWrap: true,
            children: clientWidgets,
          );
        });
  }
}
