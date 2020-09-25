import 'package:flutter/material.dart';

Future alert({
  bool dismissible = false,
  @required BuildContext context,
  @required String title,
  @required String description,
  List<Map<String, dynamic>> actions,
}) {

  var _buttons;

  if(actions != null)
    _buttons = actions.map((element) {
      return Expanded(
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: element['action'] == null ? () => Navigator.pop(context) : element["action"],
            child: Container(
              padding: EdgeInsets.all(18.0),
              decoration: BoxDecoration(
                border: Border(
                    top: BorderSide(
                        color: Colors.blueGrey, width: 0.5)),
              ),
              child: Center(
                child: Text(
                  '${element['button']}',
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    }).toList();


  return showDialog(
    barrierDismissible: dismissible,
    builder: (BuildContext context) {
      return Center(
        child: Material(
          color: Colors.transparent,
          child: Container(
            margin: EdgeInsets.all(30.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    children: <Widget>[
                      Text(
                        "$title",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.2,
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Material(
                        color: Colors.blueGrey,
                        child: SizedBox(
                          width: 60,
                          height: 0.5,
                        ),
                      ),
                      SizedBox(height: 15.0),
                      Text(
                        '$description',
                        style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 12.0,
                ),
                Row(
                  children: actions != null ? _buttons :  [Expanded(
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          padding: EdgeInsets.all(18.0),
                          decoration: BoxDecoration(
                            border: Border(
                                top: BorderSide(
                                    color: Colors.blueGrey, width: 0.5)),
                          ),
                          child: Center(
                            child: Text(
                              'OK',
                              style: TextStyle(
                                color: Colors.blueGrey,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.2,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )],
                ),
              ],
            ),
          ),
        ),
      );
    },
    context: context,
  );
}