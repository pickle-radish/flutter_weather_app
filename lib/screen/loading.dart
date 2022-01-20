// ignore_for_file: deprecated_member_use, prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';

import '../data/my_location.dart';
import '../data/network.dart';
import 'weather_screen.dart';


const apiKey = '';

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

    
  }


  void getLocation() async {
    MyLocation myLocation = MyLocation();

    await myLocation.getMyCurrentLocation();

    double? lat = myLocation.position?.latitude;
    double? lon = myLocation.position?.longitude;

    Network network = Network();
    var weatherData = await network.getJsonData('https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$apiKey&units=metric');
    var airData = await network.getJsonData('http://api.openweathermap.org/data/2.5/air_pollution?lat=$lat&lon=$lon&appid=$apiKey');

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return WeatherScreen(parseWeatherData: weatherData, parseAirData: airData);
    }));
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

}