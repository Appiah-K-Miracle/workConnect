import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:workconnect/components/appbar.dart';
import 'package:workconnect/components/popular.dart';
import 'package:workconnect/components/popular_plumber.dart';
import 'package:workconnect/screens/categories/automobile_services/car_mechanic.dart';
import 'package:workconnect/screens/categories/building/carpentry.dart';
import 'package:workconnect/screens/categories/building/electricians.dart';
import 'package:workconnect/screens/categories/automobile_services/carsprayer.dart';
import 'package:workconnect/screens/categories/building/manson.dart';
import 'package:workconnect/screens/categories/domestic_services/cleaner.dart';
import 'package:workconnect/screens/registration_question/user_questions.dart';

import '../../components/card_popular.dart';
import '../../components/homebutton.dart';
import '../../components/my_card.dart';
// import '../../components/popular_painter.dart';

class MainHomePage extends StatefulWidget {
  const MainHomePage({super.key});

  @override
  State<MainHomePage> createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {
  final PageController _controller = PageController();
  // void initState() {
  //   super.initState();

  //   WidgetsBinding.instance.addPostFrameCallback((_) {
  //     showDialog(
  //       context: context,
  //       builder: (context) => AlertDialog(
  //         content: const Text('Do you want to set up account as a worker?'),
  //         actions: [
  //           TextButton(
  //             onPressed: () {
  //               Navigator.push(
  //                 context,
  //                 MaterialPageRoute(builder: (context) {
  //                   return const UserQuestionsPage();
  //                 }),
  //               );
  //             },
  //             child: const Text('No'),
  //           ),
  //           TextButton(
  //             onPressed: () {
  //               Navigator.pop(context);
  //             },
  //             child: const Text('Yes'),
  //           ),
  //         ],
  //         title: const Text('Confirm'),
  //       ),
  //     );
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const AppBarCard(),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView(
              children: [
                Container(
                  alignment: const Alignment(0, 0.90),
                  //  color: Colors.white,
                  height: 150,

                  //  decoration: BoxDecoration(borderRadius: BorderRadius.circular(100)),

                  child: PageView(
                    scrollDirection: Axis.horizontal,
                    controller: _controller,
                    children: [
                      MyCard(
                        image: Image.asset(
                          'assets/images/mechanic_v1.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                      MyCard(
                        image: Image.asset(
                          'assets/images/painter_v1.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                      MyCard(
                        image: Image.asset('assets/images/plumber_v1.jpg',
                            fit: BoxFit.cover),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SmoothPageIndicator(
                      controller: _controller,
                      count: 3,
                      effect: ExpandingDotsEffect(
                        dotHeight: 10,
                        dotWidth: 10,
                        dotColor: Theme.of(context).primaryColorLight,
                        activeDotColor: Theme.of(context).primaryColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: (() {
                          showModalBottomSheet(
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(40),
                                ),
                              ),
                              context: context,
                              builder: (BuildContext context) {
                                return ListView(children: const [
                                  SizedBox(
                                    child: Column(
                                      children: [
                                        SizedBox(height: 20),
                                        Cleaner(),
                                      ],
                                    ),
                                  ),
                                ]);
                              });
                        }),
                        child: const HomeButton(
                            iconImagePath: 'assets/images/cleaner.png',
                            buttonText: 'Cleaner'),
                      ),
                      GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(40),
                                ),
                              ),
                              context: context,
                              builder: (BuildContext context) {
                                return ListView(children: const [
                                  SizedBox(
                                    child: Column(
                                      children: [
                                        SizedBox(height: 20),
                                        Manson(),
                                      ],
                                    ),
                                  ),
                                ]);
                              });
                        },
                        child: const HomeButton(
                            iconImagePath: 'assets/images/masonry.png',
                            buttonText: 'Manson'),
                      ),
                      GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(40),
                                ),
                              ),
                              context: context,
                              builder: (BuildContext context) {
                                return ListView(children: const [
                                  SizedBox(
                                    child: Column(
                                      children: [
                                        SizedBox(height: 20),
                                        Electrician(),
                                      ],
                                    ),
                                  ),
                                ]);
                              });
                        },
                        child: const HomeButton(
                            iconImagePath: 'assets/images/electrician.png',
                            buttonText: 'Electrician'),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(40),
                                ),
                              ),
                              context: context,
                              builder: (BuildContext context) {
                                return ListView(children: const [
                                  SizedBox(
                                    child: Column(
                                      children: [
                                        SizedBox(height: 20),
                                        PopularCard(),
                                      ],
                                    ),
                                  ),
                                ]);
                              });
                        },
                        child: const HomeButton(
                            iconImagePath: 'assets/images/painter.png',
                            buttonText: 'Painter'),
                      ),
                      GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(40),
                                ),
                              ),
                              context: context,
                              builder: (BuildContext context) {
                                return ListView(children: const [
                                  SizedBox(
                                    child: Column(
                                      children: [
                                        SizedBox(height: 20),
                                        Carpentry(),
                                      ],
                                    ),
                                  ),
                                ]);
                              });
                        },
                        child: const HomeButton(
                            iconImagePath: 'assets/images/carpenter.png',
                            buttonText: 'Carpenter'),
                      ),
                      GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(40),
                                ),
                              ),
                              context: context,
                              builder: (BuildContext context) {
                                return ListView(children: const [
                                  SizedBox(
                                    child: Column(
                                      children: [
                                        SizedBox(height: 20),
                                        CarMechanic(),
                                      ],
                                    ),
                                  ),
                                ]);
                              });
                        },
                        child: const HomeButton(
                            iconImagePath: 'assets/images/mechanic.png',
                            buttonText: 'Mechanic'),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 30,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Most Popular Workers',
                            style: TextStyle(
                              color: Theme.of(context).primaryColorLight,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'See All',
                            style: TextStyle(
                              color: Theme.of(context).primaryColorLight,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ]),
                  ),
                ),
                const SizedBox(
                  height: 250,
                  child: Popular(),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const UserQuestionsPage();
                    }));
                  },
                  child: Container(
                    width: double.infinity,
                    height: 200,
                    decoration:
                        BoxDecoration(color: Theme.of(context).cardColor),
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            'assets/images/v1.jpg',
                            fit: BoxFit.cover,
                          )),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 30,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Most Popular Painters',
                            style: TextStyle(
                              color: Theme.of(context).primaryColorLight,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'See All',
                            style: TextStyle(
                              color: Theme.of(context).primaryColorLight,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ]),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const PopularCard(),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 30,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Most Popular Plumber',
                            style: TextStyle(
                              color: Theme.of(context).primaryColorLight,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'See All',
                            style: TextStyle(
                              color: Theme.of(context).primaryColorLight,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ]),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const PopularPlumber(),
                const SizedBox(
                  height: 5,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const UserQuestionsPage();
                    }));
                  },
                  child: Container(
                    width: double.infinity,
                    height: 200,
                    decoration:
                        BoxDecoration(color: Theme.of(context).cardColor),
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            'assets/images/mechanic_v1.jpg',
                            fit: BoxFit.cover,
                          )),
                    ),
                  ),
                ),
                Container(
                  height: 30,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Most Popular Car Sprayer',
                          style: TextStyle(
                            color: Theme.of(context).primaryColorLight,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'See All',
                          style: TextStyle(
                            color: Theme.of(context).primaryColorLight,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const CarSprayer(),
                  Container(
                  height: 30,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Most Popular Mechanic',
                            style: TextStyle(
                              color: Theme.of(context).primaryColorLight,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'See All',
                            style: TextStyle(
                              color: Theme.of(context).primaryColorLight,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ]),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const CarMechanic(),
                const SizedBox(
                  height: 5,
                ),
              ],
            ),
          ),
          
        ],
      ),
    );
  }
}
