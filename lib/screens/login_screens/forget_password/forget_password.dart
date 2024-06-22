import 'package:flutter/material.dart';
import 'package:workconnect/screens/login_screens/forget_password/forget_password_email.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        showModalBottomSheet(
            context: context,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            builder: (context) => Container(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Select Optins',
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                      Text(
                        'Select one of the options given below to Reset your Password.',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) {
                              return const ForgetEmail();
                            }),
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.all(20.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.grey.shade200,
                          ),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.email_outlined,
                                size: 60.0,
                              ),
                              const SizedBox(
                                width: 10.0,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'E-mail',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineLarge,
                                  ),
                                  Text('Reset with Email',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          padding: const EdgeInsets.all(20.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.grey.shade200,
                          ),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.mobile_friendly_rounded,
                                size: 60.0,
                              ),
                              const SizedBox(
                                width: 10.0,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Phone No',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineLarge,
                                  ),
                                  Text('Reset with Phone Number',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ));
      },
      child:  Text(
        'forgot password?',
        style:  TextStyle(
          color: Theme.of(context).indicatorColor,
          fontFamily: 'Poppins',
          fontSize: 20,
        ),
      ),
    );
  }
}
