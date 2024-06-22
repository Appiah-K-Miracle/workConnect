import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';

class Popular extends StatefulWidget {
  const Popular({super.key});

  @override
  State<Popular> createState() => _PopularPainterState();
}

class _PopularPainterState extends State<Popular> {
  @override
  Widget build(BuildContext context) {
    // final usetId = FirebaseAuth.instance.currentUser!;
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('users_more_info')
            .snapshots(),
        builder: (context, snapshopt) {
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
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  width: 200,
                  decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade400,
                          blurRadius: 0.5,
                          spreadRadius: 0.1,
                        ),
                      ]),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: ClipRRect(
                            child: Image.network(
                          client['user_profile_picture'],
                          fit: BoxFit.cover,
                          width: 100,
                          height: 150,
                        )),
                      ),
                      const SizedBox(height: 10,),
                      Text(
                        client['user_name'],
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).bannerTheme.dividerColor,
                        ),
                      ),
                      Text(
                        client['skill'],
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).bannerTheme.dividerColor,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Experience: ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color:
                                  Theme.of(context).bannerTheme.dividerColor,
                            ),
                          ),
                          Text(
                            client['experience_year'],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color:
                                  Theme.of(context).bannerTheme.dividerColor,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              );
              clientWidgets.add(clientWidget);
            }
          }

          return ListView(
            scrollDirection: Axis.horizontal,
            children: clientWidgets,
          );
        });
  }
}
