// ignore_for_file: avoid_print

import 'package:geolocator/geolocator.dart';

class MyLocation {
  Position? position;


  Future<void> getMyCurrentLocation() async {
    LocationPermission permission = await Geolocator.requestPermission();

    if (permission != LocationPermission.denied) {
      try {
        position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      } catch(err) {
        print(err);
      }
    } else {
      print('Location permissions are denied');
    }
  }
}