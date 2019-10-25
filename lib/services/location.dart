import 'dart:async';

import 'package:geolocator/geolocator.dart';

class Location {
  double latitude;
  double longitude;

  Future<void> getCurrentLocation() async {
    try {
      Geolocator().forceAndroidLocationManager = true;

      Position position = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.low)
          .timeout(Duration(seconds: 30));
//          .then((position) {
//        //getting position without problems
//        print(position);
//        print('No problems getting position');
//      }).catchError((error) {
//        if (error is TimeoutException) {
//          Geolocator().getLastKnownPosition().then((position) {
//            //getting last known position
//            print(position);
//            print('Getting last known position');
//          }).catchError((error) {
//            //handle the exception
//            print(error);
//          });
//        } else {
//          //handle the exception
//          print('Handling other exception');
//        }
//      });

      latitude = position.latitude;
      longitude = position.longitude;
    } catch (exception) {
      print(exception);
    }
  }
}
