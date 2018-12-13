import 'package:meta/meta.dart';

enum Color { red, blue, orange }

class Done {
  String name = '';
  Color color;

  Done({@required String name, Color color}) {
    this.name = name;
    this.color = color;
  }
}
