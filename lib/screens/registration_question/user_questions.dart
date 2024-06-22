import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:workconnect/screens/registration_question/data/datalist.dart';
import 'package:workconnect/screens/registration_question/widgets/location.dart';
import 'package:workconnect/screens/registration_question/widgets/picturework.dart';

class UserQuestionsPage extends StatefulWidget {
  const UserQuestionsPage({super.key});

  @override
  State<UserQuestionsPage> createState() => _MyWidgetState();
}
 String? _valueSelected = experience.first;
    String? _valueChoose = categories.first;
  final _aboutUser = TextEditingController();

  File? _selectedImage;
  File? _selectedImage2;
  var _isAuth = false;
  
class _MyWidgetState extends State<UserQuestionsPage> {
 
 void submitInfo() async{
   try {
      setState(() {
        _isAuth = true;
      });
      final user = FirebaseAuth.instance.currentUser!;

      final userData = await FirebaseFirestore.instance
          .collection('users_location')
          .doc(user.uid)
          .get();

      final userData1 = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();

      // Storing image one
      final storageRef = FirebaseStorage.instance
          .ref()
          .child('user_picture')
          .child('${user.uid}.jpg');

      await storageRef.putFile(_selectedImage!);
      final imageUrl = await storageRef.getDownloadURL();

      // Storing image two

      final storageRef1 = FirebaseStorage.instance
          .ref()
          .child('user_picture1')
          .child('${user.uid}.jpg');
      await storageRef1.putFile(_selectedImage2!);
      final imageUrl1 = await storageRef1.getDownloadURL();

      
          await FirebaseFirestore.instance.collection('users_more_info').doc(user.uid).set({
    
        'user_name': userData1.data()!['username'],
        'user_phone_number': userData1.data()?['phone_number'],
        'user_email': userData1.data()!['email'],
        'user_profile_picture': userData1.data()!['image_url'],
        'userId': user.uid,
        'skill': _valueChoose,
        'experience_year': _valueSelected,
        'about_user': _aboutUser.text,
        'user_image1': imageUrl,
        'user_image2': imageUrl1,
        'location': userData.data()!['location'],
      });
      
      if (context.mounted) Navigator.pop(context);
    } on FirebaseAuthException catch (error) {
      Navigator.pop(context);
      if (error.code == 'Location not found') {
         ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(error.message ?? 'Authentication failed'),
        ),
      );

      }
     
      setState(() {
        _isAuth = false;
      });
    }

 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text('Complete Your Skills Account'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              const Text(
                'SKILLS',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  fontFamily: 'Poppins',
                  // color: Theme.of(context).primaryColor
                ),
              ),
              const SizedBox(height: 10),
              // Experience Section
              Container(
                  decoration: BoxDecoration(
                      border: Border.all(width: 1),
                      borderRadius: BorderRadius.circular(10)),
                  child: DropdownButtonHideUnderline(
                    child: ButtonTheme(
                      alignedDropdown: true,
                      child: DropdownButton<String>(
                        // dropdownColor: Theme.of(context).primaryColor,
                        isExpanded: true,
                        value: _valueChoose,
                        onChanged: (String? newValue) {
                          setState(() {
                            _valueChoose = newValue!;
                          });
                        },
                        items: categories
                            .map<DropdownMenuItem<String>>((String newValue) {
                          return DropdownMenuItem<String>(
                              value: newValue,
                              child: Text(
                                newValue,
                                style: const TextStyle(
                                    // color: Theme.of(context).primaryColor,
                                    fontFamily: 'Poppins'),
                              ));
                        }).toList(),
                      ),
                    ),
                  )),
              const SizedBox(height: 10),
              const Divider(),
              const SizedBox(height: 10),
              const Text(
                'EXPERIENCE',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  fontFamily: 'Poppins',
                  // color: Theme.of(context).primaryColor
                ),
              ),
              const SizedBox(height: 10),
              Container(
                  decoration: BoxDecoration(
                      border: Border.all(width: 1),
                      borderRadius: BorderRadius.circular(10)),
                  child: DropdownButtonHideUnderline(
                    child: ButtonTheme(
                      alignedDropdown: true,
                      child: DropdownButton<String>(
                        // dropdownColor: Theme.of(context).primaryColor,
                        isExpanded: true,
                        value: _valueSelected,
                        onChanged: (String? newValue) {
                          setState(() {
                            _valueSelected = newValue!;
                          });
                        },
                        items: experience
                            .map<DropdownMenuItem<String>>((String newValue) {
                          return DropdownMenuItem<String>(
                              value: newValue,
                              child: Text(
                                newValue,
                                style: const TextStyle(
                                    // color: Theme.of(context).primaryColor,
                                    fontFamily: 'Poppins'),
                              ));
                        }).toList(),
                      ),
                    ),
                  )),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                  controller: _aboutUser,
                  keyboardType: TextInputType.multiline,
                  minLines: 4,
                  maxLines: 5,
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        value.trim().isEmpty) {
                      return 'Please, Provide Something about you';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    fillColor: Theme.of(context).scaffoldBackgroundColor,
                    filled: true,
                    hintText: 'Write short message about your experience',
                    hintStyle: const TextStyle(
                      // color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w100,
                      fontFamily: 'Poppins',
                      fontSize: 15,
                    ),
                    enabledBorder: const OutlineInputBorder(
                        // borderSide: BorderSide(color: Theme.of(context).primaryColor)
                        ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                          // color: Theme.of(context).focusColor,

                          ),
                    ),
                  )),
              const SizedBox(height: 10),
              // Picture Section
              PictureWrok(
                onPickImage: ((pickedImage) {
                  _selectedImage = pickedImage;
                }),
                onPickImage2: ((pickedImage2) {
                  _selectedImage2 = pickedImage2;
                }),
              ),
              const SizedBox(height: 10),
              const Divider(),
              const SizedBox(height: 10),
              const Text(
                'YOUR LOCATION',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  fontFamily: 'Poppins',
                  // color: Theme.of(context).primaryColor
                ),
              ),
              const SizedBox(height: 10),
              const Location(),
              const SizedBox(height: 20),
              if (_isAuth) const CircularProgressIndicator(),
              if (!_isAuth)
                TextButton(
                  onPressed: submitInfo,
                  child: Text(
                    'Submit',
                    style: TextStyle(
                        color: Theme.of(context).copyWith().primaryColorLight,
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}