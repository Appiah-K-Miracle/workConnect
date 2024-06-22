import 'package:flutter/material.dart';

class PhoneNumber extends StatefulWidget {
  const PhoneNumber({super.key});

  @override
  State<PhoneNumber> createState() => _PhoneNumberState();
}

class _PhoneNumberState extends State<PhoneNumber> {
  final formKey = GlobalKey<FormState>();
  TextEditingController mobile = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Material(
          child: TextFormField(
            controller: mobile,
            maxLength: 10,
            validator: (val) {
              if (mobile.text.length != 10) {
                return 'Please enter valid mobile number';
              }
              return null;
            },
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              counterText: '',
              enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(width: 1),
                  borderRadius: BorderRadius.circular(6.0)),
              filled: true,
              //  labelText: 'Phone Number',
              //  labelStyle: TextStyle(
              //   fontWeight: FontWeight.w100,
              //   fontSize: 16,
              //   color: Theme.of(context).primaryColorLight
              //  ),
               floatingLabelBehavior: FloatingLabelBehavior.always,
              fillColor: Theme.of(context).scaffoldBackgroundColor,
              contentPadding: const EdgeInsets.symmetric(horizontal: 10.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(24),
                borderSide: const BorderSide(
                  // color: Colors.red,
                ),
              ),
              hintText: 'Enter Your mobile number',
              hintStyle: const TextStyle(
                  fontWeight: FontWeight.w100,
                  fontSize: 14,
                  // color: Theme.of(context).primaryColor,
                  fontFamily: 'Poppins'),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      // color: Theme.of(context).focusColor,
                    
                    ),
                    borderRadius: BorderRadius.circular(24),
                  )
            ),
          ),
        )
      ],
    ));
  }
}
