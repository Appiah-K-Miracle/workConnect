import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:flutter/material.dart';

import '../screens/search/searchscccreen.dart';

class AppBarCard extends StatefulWidget {
  const AppBarCard({super.key});

  @override
  State<AppBarCard> createState() => _AppBarState();
}

class _AppBarState extends State<AppBarCard> {
  // late String imagegUrl;
  // final user = FirebaseAuth.instance.currentUser!;
  // final storage = FirebaseStorage.instance;

  // @override
  // void initState() {
    
  //   super.initState();
  //   imagegUrl = '';
    
  // }

  // Future<void> getImageUrl() async {
  //   final ref = storage.ref(user.uid ).child('user_images')  ;
  //   final url = await ref.getDownloadURL();
  //   setState(() {
  //     imagegUrl = url;
  //   });
  // }

  

  @override
  Widget build(BuildContext context) {
    
  

  
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        CircleAvatar(
          backgroundColor: Theme.of(context).splashColor,
          // backgroundImage: NetworkImage(imagegUrl, scale: 1),
        ),
        Container(
          margin: const EdgeInsets.only(right: 10, ),
          width: 200,
          height: 40,
          decoration: BoxDecoration(
            color: Theme.of(context).highlightColor,
            borderRadius: BorderRadius.circular(2),
          ),
          child: TextFormField(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const SearchScreen();
              }));
            },
            decoration: InputDecoration(
                icon: Icon(
                  Icons.search,
                  color: Theme.of(context).primaryColor,
                  size: 30,
                ),
                border: InputBorder.none,
                hintText: "Search here...",
                hintStyle: TextStyle(
                  color: Theme.of(context).primaryColor,
                )),
          ),
        ),
        Icon(
          Icons.notifications,
          size: 30,
          color: Theme.of(context).primaryColor,
        ),
      ],
    );
  }
}
