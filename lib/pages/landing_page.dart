import "package:flutter/material.dart";
import "./quiz_page.dart";

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext ctx) {
    return Material(
        color: Colors.greenAccent,
        child: InkWell(
            onTap: () => Navigator.of(ctx).push(
                MaterialPageRoute(builder: (BuildContext ctx) => QuizPage())),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Lets Quiz !!",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 50.00,
                        fontWeight: FontWeight.bold)),
                Text(
                  "Tap to start",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.00,
                      fontWeight: FontWeight.bold),
                ),
                Divider(),
                Text(
                  "Developed by Anyesh",
                  style: TextStyle(color: Colors.white, fontSize: 15.0),
                )
              ],
            )));
  }
}
