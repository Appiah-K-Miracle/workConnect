import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
 
import 'package:workconnect/screens/homepage/mainhomepage.dart';
import 'package:workconnect/screens/profile/profile_main.dart';

import '../categories/categories.dart';
 
import '../setting/setting.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  


  int _selectedIndex = 0;
  final List<Widget> _widgetOption = <Widget>[
    const MainHomePage(),
    const CategoryPage(),
    const ProfileMain(),
    const SettingPage()
  ];

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Center(
        child: _widgetOption.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        color: Colors.white30,
        child: SafeArea(
          child: GNav(
            backgroundColor: Colors.white30,
            tabBackgroundColor: Color.fromARGB(38, 13, 19, 100),  
            gap: 8,
            tabs: const [
              GButton(
                icon: Icons.home,
                text: 'Home',
              ),
              GButton(
                icon: Icons.category,
                text: 'Categories',
              ),
              GButton(
                icon: Icons.person,
                text: 'Profile',
              ),
              GButton(
                icon: Icons.question_mark_outlined,
                text: 'FAQ',
              ),
            ],
            selectedIndex: _selectedIndex,
            onTabChange: _onItemTap,
          ),
        ),
      ),
    );
  }
}
