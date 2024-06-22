import 'package:flutter/material.dart';

import 'package:workconnect/components/card_popular.dart';
import 'package:workconnect/screens/categories/automobile_services/car_air_conditional.dart';
import 'package:workconnect/screens/categories/automobile_services/car_electrician.dart';
import 'package:workconnect/screens/categories/automobile_services/car_mechanic.dart';
import 'package:workconnect/screens/categories/automobile_services/carsprayer.dart';
import 'package:workconnect/screens/categories/building/air_codition.dart';
import 'package:workconnect/screens/categories/building/carpentry.dart';
import 'package:workconnect/screens/categories/building/cctv_installation.dart';
import 'package:workconnect/screens/categories/building/electricians.dart';
import 'package:workconnect/screens/categories/building/steel_bender.dart';
import 'package:workconnect/screens/categories/building/tiler.dart';
import 'package:workconnect/screens/categories/domestic_services/cleaner.dart';
import 'package:workconnect/screens/categories/domestic_services/decorator.dart';
import 'package:workconnect/screens/categories/domestic_services/house_keeper.dart';
import 'package:workconnect/screens/categories/domestic_services/laundry.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text('Category List'),
        centerTitle: true,
      ),
      body: SafeArea(
          child: ListView(
        children: [
          Column(
            children: [
              ExpansionTile(
                title: const Text('BUILDING / ARCHITECT'),
                childrenPadding: const EdgeInsets.only(left: 50),
                children: [
                  ListTile(
                    onTap: () {
                      showModalBottomSheet(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(40),
                            ),
                          ),
                          context: context,
                          builder: (BuildContext context) {
                            return Expanded(
                              child: ListView(children: const [
                                SizedBox(
                                  child: Column(
                                    children: [
                                      SizedBox(height: 20),
                                    CarAirConditional(),
                                    ],
                                  ),
                                ),
                              ]),
                            );
                          });
                    },
                    title: const Text('Air Conditioned Engineer'),
                  ),
                  ListTile(
                     onTap: () {
                      showModalBottomSheet(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(40),
                            ),
                          ),
                          context: context,
                          builder: (BuildContext context) {
                            return Expanded(
                              child: ListView(children: const [
                                SizedBox(
                                  child: Column(
                                    children: [
                                      SizedBox(height: 20),
                                     Ctv_Installation(),
                                    ],
                                  ),
                                ),
                              ]),
                            );
                          });
                    },
                    title: const Text('CCTV Installation'),
                  ),
                  ListTile(
                     onTap: () {
                      showModalBottomSheet(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(40),
                            ),
                          ),
                          context: context,
                          builder: (BuildContext context) {
                            return Expanded(
                              child: ListView(children: const [
                                SizedBox(
                                  child: Column(
                                    children: [
                                      SizedBox(height: 20),
                                     Carpentry(),
                                    ],
                                  ),
                                ),
                              ]),
                            );
                          });
                    },
                    title: const Text('Carpentry'),
                  ),
                  ListTile(
                     onTap: () {
                      showModalBottomSheet(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(40),
                            ),
                          ),
                          context: context,
                          builder: (BuildContext context) {
                            return Expanded(
                              child: ListView(children: const [
                                SizedBox(
                                  child: Column(
                                    children: [
                                      SizedBox(height: 20),
                                    Electrician(),
                                    ],
                                  ),
                                ),
                              ]),
                            );
                          });
                    },
                    title: const Text('Electricians'),
                  ),
                    ListTile(
                     onTap: () {
                      showModalBottomSheet(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(40),
                            ),
                          ),
                          context: context,
                          builder: (BuildContext context) {
                            return Expanded(
                              child: ListView(children: const [
                                SizedBox(
                                  child: Column(
                                    children: [
                                      SizedBox(height: 20),
                                  PopularCard(),
                                    ],
                                  ),
                                ),
                              ]),
                            );
                          });
                    },
                    title: const Text('Painter'),
                  ),
                   ListTile(
                     onTap: () {
                      showModalBottomSheet(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(40),
                            ),
                          ),
                          context: context,
                          builder: (BuildContext context) {
                            return Expanded(
                              child: ListView(children: const [
                                SizedBox(
                                  child: Column(
                                    children: [
                                      SizedBox(height: 20),
                                     PopularPlumber(),
                                    ],
                                  ),
                                ),
                              ]),
                            );
                          });
                    },
                    title: const Text('Plumber'),
                  ),
                   ListTile(
                     onTap: () {
                      showModalBottomSheet(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(40),
                            ),
                          ),
                          context: context,
                          builder: (BuildContext context) {
                            return Expanded(
                              child: ListView(children: const [
                                SizedBox(
                                  child: Column(
                                    children: [
                                      SizedBox(height: 20),
                                     Steel_Bender()
                                    ],
                                  ),
                                ),
                              ]),
                            );
                          });
                    },
                    title: const Text('Steel Benders'),
                  ),
                  ListTile(
                    onTap: () {
                      showModalBottomSheet(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(40),
                            ),
                          ),
                          context: context,
                          builder: (BuildContext context) {
                            return Expanded(
                              child: ListView(children: const [
                                SizedBox(
                                  child: Column(
                                    children: [
                                      SizedBox(height: 20),
                                    Tiler(),
                                    ],
                                  ),
                                ),
                              ]),
                            );
                          });
                    },
                    title: const Text('Tiler'),
                  )
                ],
              ),
              ExpansionTile(
                title: const Text('DOMESTIC SERVICES'),
                childrenPadding: const EdgeInsets.only(left: 50),
                children: [
                   ListTile(
                     onTap: () {
                      showModalBottomSheet(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(40),
                            ),
                          ),
                          context: context,
                          builder: (BuildContext context) {
                            return Expanded(
                              child: ListView(children: const [
                                SizedBox(
                                  child: Column(
                                    children: [
                                      SizedBox(height: 20),
                                    Decorator(),
                                    ],
                                  ),
                                ),
                              ]),
                            );
                          });
                    },
                    title: const Text('Decorator'),
                  ),
                  ListTile(
                     onTap: () {
                      showModalBottomSheet(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(40),
                            ),
                          ),
                          context: context,
                          builder: (BuildContext context) {
                            return Expanded(
                              child: ListView(children: const [
                                SizedBox(
                                  child: Column(
                                    children: [
                                      SizedBox(height: 20),
                                    Laundry(),
                                    ],
                                  ),
                                ),
                              ]),
                            );
                          });
                    },
                    title: const Text('Laundry'),
                  ),
                  ListTile(
                   onTap: () {
                      showModalBottomSheet(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(40),
                            ),
                          ),
                          context: context,
                          builder: (BuildContext context) {
                            return Expanded(
                              child: ListView(children: const [
                                SizedBox(
                                  child: Column(
                                    children: [
                                      SizedBox(height: 20),
                                     HouseKeeper(),
                                    ],
                                  ),
                                ),
                              ]),
                            );
                          });
                    },
                    title: const Text('House Keeper'),
                  ),
                  ListTile(
                   onTap: () {
                      showModalBottomSheet(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(40),
                            ),
                          ),
                          context: context,
                          builder: (BuildContext context) {
                            return Expanded(
                              child: ListView(children: const [
                                SizedBox(
                                  child: Column(
                                    children: [
                                      SizedBox(height: 20),
                                     Cleaner(),
                                    ],
                                  ),
                                ),
                              ]),
                            );
                          });
                    },
                    title: const Text('Cleaner'),
                  ),
                ],
              ),
              ExpansionTile(
                title: const Text('AUTOMOBILE'),
                childrenPadding: const EdgeInsets.only(left: 50),
                children: [
                  ListTile(
                     onTap: () {
                      showModalBottomSheet(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(40),
                            ),
                          ),
                          context: context,
                          builder: (BuildContext context) {
                            return Expanded(
                              child: ListView(children: const [
                                SizedBox(
                                  child: Column(
                                    children: [
                                      SizedBox(height: 20),
                                     CarElectrician(),
                                    ],
                                  ),
                                ),
                              ]),
                            );
                          });
                    },
                    title: const Text('Car Electricians'),
                  ),
                  ListTile(
                     onTap: () {
                      showModalBottomSheet(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(40),
                            ),
                          ),
                          context: context,
                          builder: (BuildContext context) {
                            return Expanded(
                              child: ListView(children: const [
                                SizedBox(
                                  child: Column(
                                    children: [
                                      SizedBox(height: 20),
                                   CarMechanic(),
                                    ],
                                  ),
                                ),
                              ]),
                            );
                          });
                    },
                    title: const Text('Car Mechanic'),
                  ),
                  ListTile(
                    onTap: () {
                      showModalBottomSheet(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(40),
                            ),
                          ),
                          context: context,
                          builder: (BuildContext context) {
                            return Expanded(
                              child: ListView(children: const [
                                SizedBox(
                                  child: Column(
                                    children: [
                                      SizedBox(height: 20),
                                    CarSprayer(),
                                    ],
                                  ),
                                ),
                              ]),
                            );
                          });
                    },
                    title: const Text('Car Sprayer'),
                  ),
                  ListTile(
                     onTap: () {
                      showModalBottomSheet(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(40),
                            ),
                          ),
                          context: context,
                          builder: (BuildContext context) {
                            return Expanded(
                              child: ListView(children: const [
                                SizedBox(
                                  child: Column(
                                    children: [
                                      SizedBox(height: 20),
                                    CarAirConditional(),
                                    ],
                                  ),
                                ),
                              ]),
                            );
                          });
                    },
                    title: const Text('Car Air Conditional Repair'),
                  ),
                ],
              ),
            ],
          )
        ],
      )),
    );
  }
}
