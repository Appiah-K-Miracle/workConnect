import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'forget_password/forget_password.dart';

// Creating Global variable for firebase instance.
final _firebase1 = FirebaseAuth.instance;

class LoginPage extends StatefulWidget {
  final Function()? onTap;
  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _form = GlobalKey<FormState>();
  // var _isAuth = false;
  final _enteredEmailLogin = TextEditingController();

  final _enteredPasswordLogin = TextEditingController();

  @override
  void dispose() {
   _enteredEmailLogin.dispose();
   _enteredPasswordLogin.dispose();
    super.dispose();
  }

  void signUserIn() async {
    // final isValid = _form.currentState!.validate();

    // if (isValid) {
    //   return;
    // }

    try {
      showDialog(
          context: context,
          builder: (context) => const Center(
                child: CircularProgressIndicator(),
              ));

      await _firebase1.signInWithEmailAndPassword(
          email: _enteredEmailLogin.text, password: _enteredPasswordLogin.text);
      if (context.mounted) Navigator.pop(context);
    } on FirebaseAuthException catch (error) {
      Navigator.pop(context);
      if (error.code == 'email-already-in-use') {
        //...
      }

      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(error.message ?? 'Authentication failed'),
        ),
      );
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
                height: 50,
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(top: 200),

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
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          const Text('Welcome back you\'ve been missed!',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              )),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Not a member?',
                                style: TextStyle(color: Colors.white),
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              GestureDetector(
                                onTap: widget.onTap,
                                child: const Text(
                                  'Register now',
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Form(
                            key: _form,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: Column(
                                children: [
                                  TextFormField(
                                    style: const TextStyle(
                                      color: Colors.white,
                                    fontFamily: 'Poppins',
                                    fontSize: 20,
                                    
                                    ),
                                    decoration: const InputDecoration(
                                      labelText: 'Email address',
                                      labelStyle:
                                          TextStyle(color: Colors.white),
                                      icon: Icon(
                                        Icons.email,
                                        color: Colors.white,
                                      ),
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
                                    controller: _enteredEmailLogin,
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
                                    decoration: const InputDecoration(
                                      labelText: 'Password',
                                      labelStyle:
                                          TextStyle(color: Colors.white),
                                      icon: Icon(
                                        Icons.lock,
                                        color: Colors.white,
                                      ),
                                    ),
                                    enableSuggestions: false,
                                    validator: (value) {
                                      if (value == null ||
                                          value.trim().length < 6) {
                                        return 'Password must be at least 6 characters long.';
                                      }
                                      return null;
                                    },
                                    controller: _enteredPasswordLogin,
                                    obscureText: true,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 25.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [ForgetPassword()],
                            ),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 15),
                            padding: const EdgeInsets.all(10),
                            width: double.infinity,
                            decoration:
                                const BoxDecoration(color: Colors.black87),
                            child: TextButton(
                                onPressed: signUserIn,
                                child: const Text(
                                  'Sign In',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.bold),
                                )),
                          ),
                        ],
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
