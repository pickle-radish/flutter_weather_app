// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print, unnecessary_string_interpolations, avoid_unnecessary_containers, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timer_builder/timer_builder.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/model/model.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({ Key? key, this.parseWeatherData, this.parseAirData }) : super(key: key);

  final parseWeatherData;
  final parseAirData;
  

  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  Model model = Model();

  late String cityName;
  late int temp;
  late Widget icon;
  late String desc;
  
  late Map<String, dynamic> airInfo;
  late double dust;
  late double microDust;

  var date = DateTime.now();

  @override
  void initState() {
    super.initState();

    updateData(widget.parseWeatherData, widget.parseAirData);
  }

  void updateData(dynamic weatherData, dynamic airData) {
    print(airData);

    temp = weatherData['main']['temp'].toDouble().round();
    cityName = weatherData['name'];
    
    int condition = weatherData['weather'][0]['id'];
    icon = model.getWeatherIcon(condition);
    
    desc = weatherData['weather'][0]['description'];

    airInfo = model.getAirIcon(airData['list'][0]['main']['aqi']);
    dust = airData['list'][0]['components']['pm10'];
    microDust = airData['list'][0]['components']['pm2_5'];

  }


  String getSystemTime() {
    var now = DateTime.now();

    return DateFormat("h:mm a").format(now);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.near_me),
          onPressed: (){},
          iconSize: 30,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.location_searching),
            onPressed: (){},
            iconSize: 30,
          ),
        ],
      ),
      body: Container(
        child: Stack(
          children: [
            Image.asset(
              'images/background.jpg',
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 150,
                            ),
                            Text(
                              '$cityName',
                              style:GoogleFonts.lato(
                                fontSize: 35,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              )
                            ),
                            Row(
                              children: [
                                TimerBuilder.periodic(
                                  (Duration(minutes: 1)),
                                  builder: (context) {
                                    return Text(
                                      '${getSystemTime()}',
                                      style: GoogleFonts.lato(
                                        fontSize: 16,
                                        color: Colors.white,
                                      ),
                                    );
                                  }
                                ),
                                Text(
                                  DateFormat(' - EEEE, d MMM, yyy').format(date),
                                  style: GoogleFonts.lato(
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                              ]
                            ),
                          ],
                        ),
                        Column (
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '$temp\u2103',
                              style:GoogleFonts.lato(
                                fontSize: 85,
                                fontWeight: FontWeight.w300,
                                color: Colors.white,
                              )
                            ),
                            Row(
                              children: [
                                // SvgPicture.asset('images/svg/climacon-sun.svg'),
                                icon,
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  '$desc',
                                  style: GoogleFonts.lato(
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            )
                          ]
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Divider(
                        height: 15,
                        thickness: 2,
                        color: Colors.white30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(
                                'AQI(대기질지수)',
                                style: GoogleFonts.lato(
                                  fontSize: 14,
                                  color: Colors.white,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.all(10),
                                child: Image.asset(
                                  'images/emotion/${airInfo['icon']}.png',
                                  width: 37,
                                  height: 35,
                                ),
                              ),
                              Text(
                                '${airInfo['text']}',
                                style: GoogleFonts.lato(
                                  fontSize: 14,
                                  color: airInfo['color'],
                                  fontWeight: FontWeight.bold,
                                ),
                              ), 
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                '미세먼지',
                                style: GoogleFonts.lato(
                                  fontSize: 14,
                                  color: Colors.white,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.all(10),
                                child: Text(
                                  '$dust',
                                  style: GoogleFonts.lato(
                                    fontSize: 24,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Text(
                                '㎍/m3',
                                style: GoogleFonts.lato(
                                  fontSize: 14,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                '초미세먼지',
                                style: GoogleFonts.lato(
                                  fontSize: 14,
                                  color: Colors.white,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.all(10),
                                child: Text(
                                  '$microDust',
                                  style: GoogleFonts.lato(
                                    fontSize: 24,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Text(
                                '㎍/m3',
                                style: GoogleFonts.lato(
                                  fontSize: 14,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    ]
                  ),
                ],
              ),
            ),
          ],
        ),
      )
    );
  }
}