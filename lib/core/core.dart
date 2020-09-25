import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

class Data extends ChangeNotifier {

  static List<Map> _connections = Hive.box("data").get("list") ?? [];

  List get connections => _connections;

  set add(Map map) {
    _connections.add(map);
    Hive.box("data").put('list', _connections);

    notifyListeners();
  }
}
