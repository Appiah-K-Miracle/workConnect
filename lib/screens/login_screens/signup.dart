import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

 

import '../../components/signupbutton .dart';
import '../../components/userpicture.dart';

// Creating Global variable for firebase instance.
final _firebase = FirebaseAuth.instance;

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key, required this.onTap});
  final Function()? onTap;

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  // A global key to access the forms.
  final _form = GlobalKey<FormState>();

  var _enteredEmail = '';
  final _mobile = TextEditingController();
  final _userName = TextEditingController();
  var _enteredPassword = '';
  var _isAuth = false;
  // var _confirmPassword = '';
  File? _selectedImage;
 
  
  void signUserUp() async {
    final isValid = _form.currentState!.validate();

    if (isValid && _selectedImage == null) {
      return;
    }

    _form.currentState!.save();

    try {
      setState(() {
        _isAuth = true;
      });
      final userCredentials = await _firebase.createUserWithEmailAndPassword(
          email: _enteredEmail, password: _enteredPassword);

      final storageRef = FirebaseStorage.instance
          .ref()
          .child('user_images')
          .child('${userCredentials.user!.uid}.jpg');

      await storageRef.putFile(_selectedImage!);
      final imageUrl = await storageRef.getDownloadURL();

      await FirebaseFirestore.instance
          .collection('users')
          .doc(userCredentials.user!.uid)
          .set({
        'username': _userName.text,
        'email': _enteredEmail,
        'phone_number': _mobile.text,
        'image_url': imageUrl
      });
      if (context.mounted) Navigator.pop(context);
    } on FirebaseAuthException catch (error) {
       Navigator.pop(context);
      if (error.code == 'email-already-in-use') {
        // ...
      }

      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(error.message ?? 'Authentication failed'),
        ),
      );

      setState(() {
        _isAuth = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              const Padding(padding: EdgeInsets.all(40)),
              const Text(
                'WorkConnect.',
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Poppins',
                    fontSize: 50,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 70,
              ),
              Expanded(
                child: Container(
                  // margin: const EdgeInsets.only(top: 233),
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(163, 22, 43, 64),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    ),
                  ),
                  child: Center(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: Form(
                          key: _form,
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 30,
                              ),
                             const  Text('Create an account with us.',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  )),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                 const  Text(
                                    'Already a member?',
                                    style:
                                        TextStyle(color: Colors.white),
                                  ),
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  GestureDetector(
                                    onTap: widget.onTap,
                                    child:  Text(
                                      'Sign In',
                                      style: TextStyle(
                                          color: Theme.of(context).indicatorColor,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              UserPicture(
                                onPickImage: ((pickedImage) {
                                  _selectedImage = pickedImage;
                                }),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              TextFormField(
                                 style: const TextStyle(
                                      color: Colors.white,
                                    fontFamily: 'Poppins',
                                    fontSize: 20,
                                    
                                    ),
                                decoration: const InputDecoration(
                                  labelText: 'User Name',
                                  labelStyle: TextStyle(color: Colors.white),
                                  icon: Icon(
                                    Icons.person,
                                    color: Colors.white,
                                  ),
                                ),
                                enableSuggestions: false,
                                validator: (value) {
                                  if (value == null ||
                                      value.isEmpty ||
                                      value.trim().isEmpty) {
                                    return 'Please Enter a valid name';
                                  }
                                  return null;
                                },
                                obscureText: false,
                                controller: _userName,
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              TextFormField(
                                 style: const TextStyle(
                                      color: Colors.white,
                                    fontFamily: 'Poppins',
                                    fontSize: 20,
                                    
                                    ),
                                decoration: const InputDecoration(
                                  labelText: 'Email address',
                                  labelStyle: TextStyle(color: Colors.white),
                                  icon: Icon(Icons.email, color: Colors.white),
                                ),
                                keyboardType: TextInputType.emailAddress,
                                autocorrect: false,
                                textCapitalization: TextCapitalization.none,
                                enableSuggestions: false,
                                validator: (value) {
                                  if (value == null ||
                                      value.trim().isEmpty ||
                                      !value.contains('@')) {
                                    return 'Please Enter a valid email address.';
                                  }
                                  return null;
                                },
                                onSaved: (value) => _enteredEmail = value!,
                                obscureText: false,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                 style: const TextStyle(
                                      color: Colors.white,
                                    fontFamily: 'Poppins',
                                    fontSize: 20,
                                    
                                    ),
                                controller: _mobile,
                                maxLength: 10,
                                validator: (val) {
                                  if (_mobile.text.length != 10) {
                                    return 'Please enter valid mobile number';
                                  }
                                  return null;
                                },
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  icon: Icon(Icons.mobile_friendly_outlined, color: Colors.white),
                                  counterText: '',
                                  hintText: 'Phone No',
                                  hintStyle: TextStyle(
                                    color: Colors.white
                                  )
                                ),
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              TextFormField(
                                 style: const TextStyle(
                                      color: Colors.white,
                                    fontFamily: 'Poppins',
                                    fontSize: 20,
                                    
                                    ),
                                decoration: const InputDecoration(
                                  labelText: 'Password',
                                  labelStyle: TextStyle(
                                    color: Colors.white
                                  ),
                                  icon: Icon(Icons.lock, color: Colors.white,),
                                ),
                                enableSuggestions: false,
                                validator: (value) {
                                  if (value == null ||
                                      value.trim().length < 6) {
                                    return 'Password must be at least 6 characters long.';
                                  }
                                  return null;
                                },
                                onSaved: (value) => _enteredPassword = value!,
                                obscureText: true,
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              if (_isAuth) const CircularProgressIndicator(),
                              if (!_isAuth)
                                SignUpButton(
                                  onTap: signUserUp,
                                ),
                              const SizedBox(
                                height: 50,
                              ),
                              // const Padding(
                              //   padding: EdgeInsets.symmetric(horizontal: 10.0),
                              //   child: Row(
                              //     children: [
                              //       Expanded(
                              //         child: Divider(
                              //           thickness: 0.5,
                              //           color:
                              //               Color.fromARGB(110, 127, 125, 125),
                              //         ),
                              //       ),
                              //       Text(
                              //         'Or continue with',
                              //         style: TextStyle(
                              //             color:
                              //                 Colors.white),
                              //       ),
                              //       Expanded(
                              //         child: Divider(
                              //           thickness: 0.5,
                              //           color:
                              //               Color.fromARGB(110, 127, 125, 125),
                              //         ),
                              //       ),
                              //     ],
                              //   ),
                              // ),
                              // const SizedBox(
                              //   height: 50,
                              // ),
                              // const Row(
                              //   mainAxisAlignment: MainAxisAlignment.center,
                              //   children: [
                              //     SquareBox(
                              //         imagePath: 'assets/images/google.png'),
                              //     SizedBox(
                              //       width: 25,
                              //     ),
                              //     SquareBox(
                              //         imagePath: 'assets/images/apple.png'),
                              //   ],
                              // ),
                              const SizedBox(
                                height: 50,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
