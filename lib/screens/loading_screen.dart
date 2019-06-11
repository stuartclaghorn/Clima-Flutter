import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:clima/services/location.dart';
import 'package:http/http.dart';
import 'dart:convert';
class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  Position position;

  @override
  void initState() {
    super.initState();
    getLocation();
    // getData();
  }

  void getLocation() async {
    Location location = Location();
    await location.getLocation();
    print(location.latitude);
    print(location.longitude);
  }

  void getData() async {
    String url = 'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&=appid=a1c65e19e441ff3c25023867d5f9350b'
    Response response = await get(url);
    if (response.statusCode == 200) {
      String data = response.body;
      // print(data);
      var weatherDescription = jsonDecode(data)['weather'][0]['main'];
      print(weatherDescription);
    } else {
      print(response.statusCode);
    }
    // print(response);
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold();
  }
}
