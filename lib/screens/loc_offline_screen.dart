import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:orabyte/core/constants.dart';

import '../components/resuable_inputs.dart';

class LocOfflineScreen extends StatefulWidget {
  @override
  _LocOfflineScreenState createState() => _LocOfflineScreenState();
}

class _LocOfflineScreenState extends State<LocOfflineScreen> {
  String _searchItem;
  TextEditingController _searchInput = TextEditingController();

  @override
  void initState() {
    super.initState();

    _searchInput.addListener(() {
      setState(() {
        _searchItem = _searchInput.text;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text("Location", style: TextStyle(color: Colors.black),),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back, color: primaryColorAlt,),
        ),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(height: 15.0,),
          Container(
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.1),
              borderRadius: BorderRadius.circular(100.0)
            ),
            margin: EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              children: <Widget>[
                Icon(Icons.search),
                SizedBox(width: 12.0,),
                Expanded(
                  child: TextField(
                    controller: _searchInput,
                    decoration: InputDecoration.collapsed(hintText: "Search Locations..."),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Expanded(
            child: (_searchItem != null && _searchItem != "") ? SearchList(_searchItem) :
            ListView(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    locationTile(title: "Science"),
                    SizedBox(
                      width: 20,
                    ),
                    locationTile(title: "New Site"),

                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    locationTile(title: "Old Site"),
                    SizedBox(
                      width: 20,
                    ),
                    locationTile(title: "Ayensu"),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget locationTile({String title, Function action}) {
    return Material(
      color: primaryColor,
      child: InkWell(
        onTap: action ?? () {},
        child: Container(
          padding: EdgeInsets.all(10.0),
          width: 100,
          height: 100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text(
                "$title",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SearchList extends StatelessWidget {
  static String item;
  SearchList(item);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[],
    );
  }
}
