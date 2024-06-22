import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
 

class ForgetEmail extends StatefulWidget {
  const ForgetEmail({super.key});

  @override
  State<ForgetEmail> createState() => _ForgetEmailState();
}

class _ForgetEmailState extends State<ForgetEmail> {
  final _resetController = TextEditingController();
  @override
  void dispose() {
    _resetController.dispose();
    super.dispose();
  }

  Future passwordReset()async{
    try{
        await FirebaseAuth.instance.sendPasswordResetEmail(email: _resetController.text.trim());
        showDialog(context: context, 
      builder: (context){
        return AlertDialog(
          content: Text('Password reset link sent! Check your email.'),
        );
      });
    }on FirebaseAuthException catch (e){
      showDialog(context: context, 
      builder: (context){
        return AlertDialog(
          content: Text(e.message.toString()),
        );
      });
    }
  
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  Lottie.asset(
                    'assets/introImage/resetpassoword.json',
                    width: 400,
                    height: 400,
                    fit: BoxFit.fill,
                  ),
                  Text('Forget Password',
                      style: TextStyle(
                          color: Colors.grey.shade200,
                          fontFamily: 'Poppins',
                          fontSize: 40,
                          fontWeight: FontWeight.bold)),
                  Text('Reset password using your Email. ',
                      style: TextStyle(
                          color: Colors.grey.shade200,
                          fontFamily: 'Poppins',
                          fontSize: 18,
                          fontWeight: FontWeight.w300)),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Form(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        children: [
                          TextFormField(
                            controller: _resetController,
                            style: const TextStyle(color: Colors.white),
                            decoration: const InputDecoration(
                              
                              focusColor: Colors.white,
                              icon: Icon(Icons.email_outlined),
                              label: Text(
                                'Email',
                                style: TextStyle(color: Colors.white),
                              ),
                              hintText: 'Email',
                              hintStyle: TextStyle(color: Colors.white),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 30.0),
                            child: SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                  onPressed: () {
                                    passwordReset();
                                    // Navigator.push(context,
                                    //     MaterialPageRoute(builder: (context) {
                                    //   return const VerificationPage();
                                    // }));
                                  },
                                  child: const Text('Next')),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
