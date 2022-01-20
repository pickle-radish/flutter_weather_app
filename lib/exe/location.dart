// ignore_for_file: deprecated_member_use, prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart';
import 'dart:convert';

class Loading extends StatefulWidget {
  const Loading({ Key? key }) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          onPressed: () {
            getLocation();
          },
          child: Text(
            'Get my location',
            style: TextStyle(
              color: Colors.white
            )
          ),
          color: Colors.blue,
        
        ),
      )
    );
  }


  void getLocation() async {
    // LocationPermission permission = await Geolocator.checkPermission();

    LocationPermission permission = await Geolocator.requestPermission();

    if (permission != LocationPermission.denied) {
      try {
        Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
        print(position);
        print(position.latitude);
        print(position.longitude);
      } catch(err) {
        print(err);
      }
    } else {
      print('Location permissions are denied');
    }
  }

  void fetchData() async {
    Response response = await get(Uri.parse('https://samples.openweathermap.org/data/2.5/weather?q=London&appid=b1b15e88fa797225412429c1c50c122a1'));

    if(response.statusCode == 200) {
      // String jsonData = response.body;
      // var myJson = jsonDecode(jsonData)['weather'][0]['description'];
      // var wind = jsonDecode(jsonData)['wind']['speed'];
      // var id = jsonDecode(jsonData)['id'];\
      print('success');
    } else {
      print(response.statusCode);
    }
  }
}