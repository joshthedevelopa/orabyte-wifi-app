import 'package:flutter/material.dart';

class ReusableInputCard extends StatefulWidget {
  final Function validate;
  final TextInputType inputType;
  final String label;
  final EdgeInsets margin;
  final TextEditingController inputController;

  ReusableInputCard({this.validate(String value), this.inputType, this.label, this.margin, @required this.inputController});


  @override
  _ReusableInputCardState createState() => _ReusableInputCardState();
}

class _ReusableInputCardState extends State<ReusableInputCard> {
  String error;

  @override
  void initState() {
    super.initState();

    if(widget.validate != null)
      widget.inputController.addListener(() {
        setState(() {
          error = widget.validate(widget.inputController.text);
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(
              "${widget.label ?? ''}",
              style: TextStyle(color: Colors.blueGrey.withOpacity(0.8), fontWeight: FontWeight.w500),
            ),
          ),
          Card(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: TextField(
                controller: widget.inputController,
                keyboardType: widget.inputType,
                decoration: InputDecoration.collapsed(hintText: ""),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            child: Text(
              "${error ?? ''}",
              style: TextStyle(fontSize: 13.0, color: Colors.red),
            ),
          )
        ],
      ),
    );
  }
}