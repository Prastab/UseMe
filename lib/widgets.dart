import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF97B62F),
      body: SafeArea(
        child: Container(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              "image/logo.png",
              height: 300,
            ),
            Text("UseMe",
                style: TextStyle(
                  fontSize: 50,
                )),
            Center(
              child: SpinKitDoubleBounce(
                color: Color(0xFFFF8066),
                size: 60,
              ),
            ),
          ],
        )),
      ),
    );
  }
}

class RoundedButton extends StatelessWidget {
  RoundedButton({this.title, this.colour, @required this.onPressed});

  final Color colour;
  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 40),
      child: Material(
        elevation: 5.0,
        color: colour,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          splashColor: Colors.orange,
          onPressed: onPressed,
          minWidth: 260.0,
          height: 50.0,
          child: Text(
            title,
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      ),
    );
  }
}
