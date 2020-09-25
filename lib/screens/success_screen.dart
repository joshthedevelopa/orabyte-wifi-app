import 'package:flutter/material.dart';
import 'package:orabyte/core/constants.dart';

class SuccessScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: primaryColorAlt,),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(
              Icons.wifi,
              color: primaryColorAlt,
              size: 100.0,
            ),
            SizedBox(height: 24,),
            Text("You Are Connected", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 30.0, color: textColor),),
          ],
        ),
      ),
    );
  }
}
