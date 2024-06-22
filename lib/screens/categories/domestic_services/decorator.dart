import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Decorator extends StatefulWidget {
  const Decorator({super.key});

  @override
  State<Decorator> createState() => _PopularCardState();
}

class _PopularCardState extends State<Decorator> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('users_more_info')
            .where("skill", whereIn: ['Decorator']).snapshots(),
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
                            onPressed: () {},
                            icon: (const Icon(
                              Icons.phone,
                              size: 15,
                            )),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: (const Icon(
                              Icons.message,
                              size: 15,
                            )),
                          )
                        ],
                      ),
                      Text(client['location']),
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
