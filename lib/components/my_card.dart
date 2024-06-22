import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  const MyCard({
    super.key,
    required this.image
    
  });

 final Image image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Container(
        width: 200,
        decoration: BoxDecoration(
          
           
          borderRadius: BorderRadius.circular(5),
          // boxShadow: const [
          //   BoxShadow(
          //     color: Colors.grey,
          //     blurRadius: 1.0, // soften the shadow
          //     spreadRadius: 2.0, //extend the shadow
          //     offset: Offset(0.0, 0.0),
          //   )
          // ],
        ),
        child: image,
      ),
    );
  }
}
