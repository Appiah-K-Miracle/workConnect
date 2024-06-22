import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:workconnect/screens/messaging/messaging.dart';

class PopularPlumber extends StatefulWidget {
  const PopularPlumber({super.key});

  @override
  State<PopularPlumber> createState() => _PopularCardState();
}

class _PopularCardState extends State<PopularPlumber> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('users_more_info')
            .where("skill", whereIn: ['Plumber']).snapshots(),
        builder: (context, snapshopt) {
          List<Row> clientWidgets = [];
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
              final clientWidget = Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 25.0),
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(client['user_profile_picture']),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        client['user_name'],
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          Text(client['skill']),
                          const SizedBox(
                            width: 80,
                          ),
                          IconButton(
                            onPressed: () async {
                              final user = FirebaseAuth.instance.currentUser!;
                             final db = FirebaseFirestore.instance;
                              final docRef = db.collection("users").doc(user.uid);
                              docRef.get().then(
                                (DocumentSnapshot doc) {
                                  final data =
                                      doc.data() as Map<dynamic, dynamic>;
                                  final Uri url = Uri(
                                    scheme: 'tel',
                                    path: data['phone_number'],
                                  );
                                  if(launchUrl(url) == true){
                                        launchUrl(url);
                                  }
                              
                                },
                                onError: (e) =>
                                    print("Error getting document: $e"),
                              );
                            },
                            icon: (const Icon(
                              Icons.phone,
                              size: 15,
                            )),
                          ),
                          IconButton(
                            onPressed: () {
                               Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return const Messaging();
                                }));
                            },
                            icon: (const Icon(
                              Icons.message,
                              size: 15,
                            )),
                          )
                        ],
                      ),
                      Text(client['location']),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  )
                ],
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
