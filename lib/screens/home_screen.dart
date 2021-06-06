import 'package:flutter/material.dart';
import '../widgets.dart';
import 'degradable_screen.dart';
import 'nondegradable_screen.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:location/location.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    getAirQualityIndex();

    super.initState();
  }

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
        setState(() {
          loading = false;
        });
      }
    } catch (e) {
      print(e);
    }
  }

  bool loading = true;
  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: Color(0xFF97B62F),
            appBar: AppBar(
              title: Text("UseMe"),
            ),
            body: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text("Air Quality Index Data",
                        style: TextStyle(fontSize: 24, color: Colors.black)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Center(
                      child: Material(
                        borderRadius: BorderRadius.all(Radius.circular(24)),
                        elevation: 15,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(
                              int.parse("0xFF" + color.substring(1)),
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(24)),
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: 30, vertical: 40),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Air Quality Index : ${aqi.toString()}",
                                style: TextStyle(
                                    fontSize: 24, color: Colors.black),
                              ),
                              Text(
                                "Status : $category",
                                style: TextStyle(
                                    fontSize: 24, color: Colors.black),
                              ),
                              Text(
                                "Dominant Pollutant : $dominantPollutant",
                                style: TextStyle(
                                    fontSize: 24, color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Use Me",
                          style: TextStyle(fontSize: 24),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          "Find Recyling factories and places nearby you to properly manage all the wastes",
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Type of waste', style: TextStyle(fontSize: 24)),
                        SizedBox(
                          height: 20,
                        ),
                        RoundedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DegradableScreen(),
                              ),
                            );
                          },
                          title: "BioDegradable Waste",
                          colour: Colors.green,
                        ),
                        RoundedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => NonDegradableScreen(),
                              ),
                            );
                          },
                          title: "NonDegradable Waste",
                          colour: Colors.red,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ));
  }
}
