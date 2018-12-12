import 'package:flutter/material.dart';
import '../model/done.dart';
import '../bloc/done_list_provider.dart';

class ChartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final doneList = DoneListProvider.of(context);
    return StreamBuilder<List<Done>>(
        stream: doneList.items,
        builder: (context, snapshot) {
          if (snapshot.data == null || snapshot.data.isEmpty) {
            return Center(
              child: Text('Item is empty'),
            );
          }
          return Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: ListView(
                children:
                    snapshot.data.map((item) => Text('${item.name}')).toList(),
              ));
        });
  }
}
