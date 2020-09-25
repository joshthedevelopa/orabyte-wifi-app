import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ReusableLoader extends StatelessWidget {
  final Widget child;
  final bool isLoading;

  ReusableLoader({this.child, this.isLoading = true});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraint) {
        return Stack(
          fit: StackFit.expand,
          children: <Widget>[
            child,
            !isLoading
                ? SizedBox()
                : Container(
                    color: Colors.blueGrey.withOpacity(0.3),
                    width: constraint.maxWidth,
                    height: constraint.maxHeight,
                    child: Center(
                      child: SpinKitFadingCircle(
                        color: Colors.blue,
                        size: 80.0,
                      ),
                    ),
                  ),
          ],
        );
      },
    );
  }
}

