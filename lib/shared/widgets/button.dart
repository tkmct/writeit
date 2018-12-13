import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Button extends StatelessWidget {
  final Widget child;
  final void Function() onTap;

  Button({@required Widget child, @required void Function() onTap})
      : child = child,
        onTap = onTap;

  @override
  Widget build(BuildContext context) => GestureDetector(
        child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(4.0)),
                border: Border.all(
                    style: BorderStyle.solid, color: Colors.black38)),
            padding: EdgeInsets.fromLTRB(10, 8, 10, 8),
            child: child),
        onTap: onTap,
      );
}
