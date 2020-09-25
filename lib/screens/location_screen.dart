import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:orabyte/core/constants.dart';
import 'package:orabyte/screens/map_screen.dart';

import 'loc_offline_screen.dart';

class LocationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Location",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Container(
            color: Colors.deepOrangeAccent.withOpacity(0.3),
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.35,
            child: Stack(
              children: <Widget>[
                Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Find Wi-Fi Location",
                        style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w600,
                            color: textColor),
                      ),
                    )),
                Container(
                  child: Image.asset(
                    "assets/map-01.jpg",
                    fit: BoxFit.fill,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 20.0),
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 10.0),
                      color: Colors.deepOrange,
                      padding: EdgeInsets.all(16.0),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  "Access Map",
                                  style: TextStyle(
                                      color: Colors.white.withOpacity(0.9),
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 8.0,
                                ),
                                Text(
                                  "Needs data conntection",
                                  style: TextStyle(
                                      color: Colors.white.withOpacity(0.9),
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                          Material(
                            color: Colors.white,
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => MapScreen()));
                              },
                              child: Container(
                                padding: EdgeInsets.all(16.0),
                                child: Icon(
                                  Icons.arrow_forward,
                                  color: primaryColorAlt,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 10.0),
                      color: Colors.deepOrange,
                      padding: EdgeInsets.all(16.0),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  "Locate Manually",
                                  style: TextStyle(
                                      color: Colors.white.withOpacity(0.9),
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 8.0,
                                ),
                                Text(
                                  "No data conntection needed",
                                  style: TextStyle(
                                      color: Colors.white.withOpacity(0.9),
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                          Material(
                            color: Colors.white,
                            child: InkWell(
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          LocOfflineScreen())),
                              child: Container(
                                padding: EdgeInsets.all(16.0),
                                child: Icon(
                                  Icons.arrow_forward,
                                  color: primaryColorAlt,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
