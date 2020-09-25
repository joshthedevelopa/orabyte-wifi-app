import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:orabyte/core/constants.dart';
import '../core/core.dart';
import 'package:provider/provider.dart';

class HistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text("Recent Connection"),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Column(
        children: <Widget>[
          Material(
            color: Colors.deepOrange,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    child: Center(child: Text("NAME", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, letterSpacing: 1.2),)),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    child: Center(child: Text("PASSWORD", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, letterSpacing: 1.2),)),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Consumer<Data>(
              builder: (context, data, child) {
                if(data == null)
                  return Center(child: Text("No Connection made", style: TextStyle(color: Colors.blueGrey.withOpacity(0.5), fontWeight: FontWeight.bold, fontSize: 25.0),),);
                else
                  return ListView.builder(
                itemCount: data.connections.length,
                itemBuilder: (context, index) {
                    return Container(
                    width: double.infinity,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 16.0),
                            child: Center(child: Text("${data.connections[index]["ssid"]}", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, letterSpacing: 1.2),)),
                          ),
                        ),
                        Material(color: Colors.deepOrange,child: SizedBox(width: 0.5, height: 10.0,)),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 16.0),
                            child: Center(child: Text("${data.connections[index]["password"]}", style: TextStyle(color: textColor, fontWeight: FontWeight.bold, letterSpacing: 1.2),)),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
              },
            ),
          ),
        ],
      ),
    );
  }
}
