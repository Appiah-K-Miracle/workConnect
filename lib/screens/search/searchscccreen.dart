import 'package:flutter/material.dart';
 

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
          child: IntrinsicHeight(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('What worker are you looking for?', style: Theme.of(context).textTheme.headlineSmall,),
                const SizedBox(height: 10,),
                const TextField(
                  
                  decoration:  InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(width: 1),
                    ),
                    labelText: 'Type Work',
                    hintText: '@example: Painters'
                    
                  ),
                ),
                const SizedBox(height: 10.0,),
                Container(
                  height: 30,
                  width: 5,
              
                  decoration: BoxDecoration(
                    color: Colors.orange.shade400
                  ),
                ),
                Text('Pick a Location', style: Theme.of(context).textTheme.headlineSmall,),
                const SizedBox(height: 10,),
                const TextField(
                  decoration:  InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(width: 1),
                    ),
                    labelText: 'Type location',
                    hintText: '@example: Kumasi'
                    
                  ),
                ),
                const SizedBox(height: 10,),

              ],
              
            ),
          ),
        ),
      ),
    );
  }
}