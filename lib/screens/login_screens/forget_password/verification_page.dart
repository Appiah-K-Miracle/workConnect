import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:google_fonts/google_fonts.dart';
 

class VerificationPage extends StatefulWidget {
  const VerificationPage({super.key});

  @override
  State<VerificationPage> createState() => _ForgetEmailState();
}

class _ForgetEmailState extends State<VerificationPage> {
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
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 100.0, horizontal: 50.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('CO\nDE', style: GoogleFonts.montserrat(
                    fontSize: 80.0,
                    fontWeight: FontWeight.bold
                  ),),
                  Text('Verification'.toUpperCase(), style: Theme.of(context).textTheme.headlineSmall,),
                  const SizedBox(height: 20.0,),
                  const Text('Enter the varification code send to: amdwatkins123.@gmail.com', textAlign: TextAlign.center,),
                  const SizedBox(height: 20.0,),
                  OtpTextField(
                    numberOfFields: 6,
                    fillColor: Colors.black.withOpacity(0.5),
                    filled: true,
                    onSubmit: (code){},
                  ),
                  const SizedBox(height: 20.0,),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(onPressed: (){}, 
                    child: const Text('Next')),
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