import '../widgets.dart';
import 'package:flutter/material.dart';
import 'map_screen.dart';
import '../models/farms_model.dart';

class DegradableScreen extends StatelessWidget {
  const DegradableScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        title: Text("Degradable"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 30,
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: ExpansionTile(
                  backgroundColor: Colors.blue,
                  title: Text(
                    "Degradable Waste",
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                          "Biodegradable waste includes any organic matter in waste which can be broken down into carbon dioxide, water, methane or simple organic molecules by micro-organisms and other living things by composting, aerobic digestion, anaerobic digestion or similar processes.",
                          style: TextStyle(fontSize: 18, color: Colors.white)),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: ExpansionTile(
                  backgroundColor: Colors.blue,
                  title: Text(
                    "Examples of Degradable Waste",
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                          "Degradable Wastes include Food waste, Paper waste, Human waste, manure, sewage, etc.",
                          style: TextStyle(fontSize: 18, color: Colors.white)),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              ExpansionTile(
                backgroundColor: Colors.white,
                title: Text(
                  "Composition of Wastes",
                  style: TextStyle(fontSize: 22, color: Colors.white),
                ),
                children: [
                  Image.asset("image/degrad.jpg", height: 300),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                padding: EdgeInsets.all(20),
                child: Text(
                    "Find nearby places to dispsoe degradable wastes properly.",
                    style: TextStyle(fontSize: 18, color: Colors.white)),
              ),
              SizedBox(
                height: 40,
              ),
              RoundedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MapScreen(factories)));
                },
                title: "See the map",
                colour: Colors.orange,
              )
            ],
          ),
        ),
      ),
    );
  }
}
