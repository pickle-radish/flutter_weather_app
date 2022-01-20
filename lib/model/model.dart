// ignore_for_file: prefer_collection_literals

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Model {
  Widget getWeatherIcon(int condition) {

    if(condition < 300) {
      return SvgPicture.asset(
        'images/svg/climacon-cloud_lightning.svg',
        color: Colors.black87,
      );
    } else if(condition < 600) {
      return SvgPicture.asset(
        'images/svg/climacon-cloud_rain.svg',
        color: Colors.black87,
      );
    } else if(condition < 600) {
      return SvgPicture.asset(
        'images/svg/climacon-cloud_snow_alt.svg',
        color: Colors.black87,
      );
    } else if(condition == 800) {
      return SvgPicture.asset(
        'images/svg/climacon-sun.svg',
        color: Colors.black87,
      );
    } else if(condition <= 804) {
      return SvgPicture.asset(
        'images/svg/climacon-clund_sun.svg',
        color: Colors.black87,
      );
    } else {
      return SvgPicture.asset(
        'images/svg/climacon-moon.svg',
        color: Colors.black87,
      );
    }
  }


  Map<String, dynamic> getAirIcon(int condition) {
    Map<String, dynamic> airData;

    if(condition == 1) {
      airData = {
        'icon' : 'good',
        'text' : '매우좋음',
        'color' : Colors.indigo,
      };
    } else if(condition == 2) {
      airData = {
        'icon' : 'fair',
        'text' : '좋음',
        'color' : Colors.indigo,
      };
    } else if(condition == 3) {
      airData = {
        'icon' : 'moderate',
        'text' : '보통',
        'color' : Colors.black87,
      };
    } else if(condition == 4) {
      airData = {
        'icon' : 'poor',
        'text' : '나쁨',
        'color' : Colors.black87,
      };
    } else {
      airData = {
        'icon' : 'bad',
        'text' : '매우나쁨',
        'color' : Colors.black87,
      };
    }

    return airData;
  }
}