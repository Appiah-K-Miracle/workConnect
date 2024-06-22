import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
 
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

 

class Location extends StatefulWidget {
  const Location({Key? key}) : super(key: key);

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  Position? currentPosition;
  late bool isLoading = false;
  String? _currentLocation;
  late LocationPermission permission;

  Future<Position> getPosition() async {
    isLoading = await Geolocator.isLocationServiceEnabled();

    permission = await Geolocator.checkPermission();
    if (!isLoading) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    return await Geolocator.getCurrentPosition();
  }

  Future getAddressFromLatLng(long, lat) async {
    try {
      List<Placemark> placemark = await placemarkFromCoordinates(lat, long);

      Placemark place = placemark[0];

      setState(() {
        _currentLocation =
            "${place.locality}, ${place.administrativeArea}, ${place.country}";
      });
    } catch (e) {
      print(e);
    }

    try {
      final user = FirebaseAuth.instance.currentUser!;

      await FirebaseFirestore.instance
          .collection('users_location')
          .doc(user.uid)
          .set({
        'location': _currentLocation,
      });
      // send to firebase
      // FirebaseFirestore.instance.collection('user_location').add({
      //   'location': _currentLocation,
      // });
    } on FirebaseAuthException catch (error) {
      if (error.code == 'Location not found') {
        // ...
      }
    }
  }

  Future getCurrentLocation() async {
    try {
      isLoading = true;

      currentPosition = await getPosition();
      getAddressFromLatLng(
          currentPosition!.longitude, currentPosition!.latitude);

      isLoading = false;
    } catch (e) {
      print(e);
    }
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              _currentLocation == null ? 'No Address Found' : _currentLocation!,
              style: const TextStyle(fontSize: 23),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () async {
              _currentLocation = await getCurrentLocation();
            },
            child: const Text(
              'Get Current Location',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                fontFamily: 'Poppins',
                // color: Theme.of(context).primaryColor
              ),
            ),
          ),
        ],
      ),
    );
  }
}
