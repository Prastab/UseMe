import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:location/location.dart';

int aqi;
String color = '#FFFFFF';
String category;
String dominantPollutant;

void getAirQualityIndex() async {
  try {
    Location location = new Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {}
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.DENIED) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.GRANTED) {}
    }

    _locationData = await location.getLocation();

    final lat = _locationData.latitude;
    final long = _locationData.longitude;
    print(lat);
    print(long);
    final url = Uri.parse(
        "https://api.breezometer.com/air-quality/v2/current-conditions?lat=$lat&lon=$long&key=YOUR_API_KEY_HERE");
    print(url);
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var result = json.decode(response.body)["data"]["indexes"]["baqi"];
      print(result);
      aqi = result["aqi"];
      color = result["color"];
      category = result["category"];
      dominantPollutant = result["dominant_pollutant"];
    }
  } catch (e) {
    print(e);
  }
}
