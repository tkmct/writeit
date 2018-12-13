import 'package:flutter/material.dart';
import './root_navigation.dart';
import './shared/bloc/done_list_provider.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return DoneListProvider(
        child: MaterialApp(
            title: 'Tab Bar App',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: RootNavigation()));
  }
}
