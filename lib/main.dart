import 'dart:io';

import 'package:flutter/material.dart';

import 'package:barcode_scan/barcode_scan.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:wifi_configuration/wifi_configuration.dart';
import 'package:path_provider/path_provider.dart' as path;

import 'core/core.dart';
import 'screens/history_screen.dart';
import 'screens/location_screen.dart';
import 'screens/success_screen.dart';

import 'components/reusable_loader.dart';
import 'components/reusable_functions.dart' as func;

import 'core/constants.dart';




void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Directory _path = await path.getApplicationDocumentsDirectory();
  Hive
    ..init(_path.path)
    ..openBox("data");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Data(),
      builder: (BuildContext context, Widget  child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Orabyte Wifi Access',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  bool _loader = false;
  String _ssid, _pass;
  TabController _tabController;

  Future _getDetails() async {
    try {
      setState(() {
        _loader = true;
      });
      ScanResult qr = await BarcodeScanner.scan(options: ScanOptions());
      var _test = qr.rawContent;
      List<String> _t = _test.split(";");
      _ssid = _t[1].split(":")[1];
      _pass = _t[2].split(":")[1];

      WifiConnectionStatus status = await WifiConfiguration.connectToWifi(
          _ssid, _pass, "com.joshthedevelopa.Orabyte");

      switch (status) {
        case WifiConnectionStatus.connected:
          setState(() {
            _loader = false;
          });
          func.alert(
              context: context,
              title: "WiFi Connected Successfully",
              description: "WiFi access point connected successfully",
              actions: [
                {
                  "button": "OK",
                  "action": () {

                    var _data = Data();
                    _data.add = {
                      "ssid": _ssid,
                      "password": _pass
                    };

                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return SuccessScreen();
                    }));
                  }
                }
              ]);
          break;

        case WifiConnectionStatus.alreadyConnected:
          func.alert(
              context: context,
              title: "Already Connected",
              description: "WiFi is already connected");
          break;

        case WifiConnectionStatus.notConnected:
          func.alert(
              context: context,
              title: "Connection Error",
              description: "Could not connect to WiFi");
          break;

        case WifiConnectionStatus.platformNotSupported:
          func.alert(
              context: context,
              title: "Platform Error",
              description: "Platform Not supported");
          break;

        case WifiConnectionStatus.profileAlreadyInstalled:
          func.alert(
              context: context,
              title: "Profile Already Installed",
              description: "Profile loaded and already Installed");
          break;

        case WifiConnectionStatus.locationNotAllowed:
          func.alert(
              context: context,
              title: "Location Error",
              description: "Location not allowed");
          break;

        default:
          setState(() {
            func.alert(
                context: context,
                title: "Unknown Error",
                description: "SSID : $_ssid \nPassword: $_pass");
          });
          break;
      }
      setState(() {
        _loader= false;
      });
    } on RangeError {
      setState(() {
        _loader= false;
      });
      func.alert(
          context: context,
          title: "Operation Stopped",
          description: "Operation was cancelled");

    } catch (e) {
      setState(() {
        _loader= false;
      });
      func.alert(
          context: context,
          title: "Unknown Occured",
          description: "Error ocurred : $e");
    }
  }


  @override
  void initState() {
    super.initState();

    _tabController = TabController(vsync: this, length: 3, initialIndex: 1);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ReusableLoader(
      isLoading: _loader,
      child: Column(
        children: <Widget>[
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: <Widget>[
                HistoryScreen(),
                Scaffold(
                  backgroundColor: Colors.white,
                  appBar: AppBar(
                    backgroundColor: Color(0xfffe7d55),
                    title: Text("QR App"),
                    centerTitle: true,
                  ),
                  body: Container(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(height: 25.0,),
                        Image.asset("assets/QR icon.png", width: 180, height: 180,),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Let\s Connect',
                          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 30.0, color: textColor),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100.0),
                              side: BorderSide(width: 0.5, color: Colors.transparent)),
                          onPressed: _getDetails,
                          child: Container(
                            padding:
                            EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0),
                            width: 150.0,
                            child: Center(
                              child: Text(
                                "Scan",
                                style: TextStyle(
                                    fontSize: 20.0, fontWeight: FontWeight.w500, color: Colors.white),
                              ),
                            ),
                          ),
                          color: primaryColor,
                          elevation: 2.0,
                        ),
                        SizedBox(
                          height: 24.0,
                        ),
                        RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100.0),
                              side: BorderSide(width: 0.5, color: Colors.transparent)),
                          onPressed: () => _tabController.index = 2,
                          child: Container(
                            padding:
                            EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0),
                            width: 150.0,
                            child: Center(
                              child: Text(
                                "Locate",
                                style: TextStyle(
                                    fontSize: 20.0, fontWeight: FontWeight.w500, color: Colors.white),
                              ),
                            ),
                          ),
                          color: primaryColor,
                          elevation: 2.0,
                        )
                      ],
                    ),
                  ),
                ),
                LocationScreen(),
              ],
            ),
          ),
          Material(
            elevation: 6.0,
            shadowColor: Colors.deepOrangeAccent,
            child: TabBar(
              indicatorColor: primaryColorAlt,
              labelColor: primaryColorAlt,
              unselectedLabelColor: supportColor,
              controller: _tabController,
              tabs: <Widget>[
                Tab(child: Icon(Icons.history),),
                Tab(child: Icon(Icons.home),),
                Tab(child: Icon(Icons.pin_drop),),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
