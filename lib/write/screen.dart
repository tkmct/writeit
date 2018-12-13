import 'package:flutter/material.dart';
import './widgets/input_field.dart';
import '../shared/bloc/done_list.dart';
import '../shared/bloc/done_list_provider.dart';
import '../shared/model/done.dart';
import '../shared/widgets/button.dart';

class WriteScreen extends StatelessWidget {
  final TextEditingController _textController = TextEditingController();
  void _handleSubmitted(String text, DoneListBloc doneList) {
    _textController.clear();
    doneList.doneListAddition.add(DoneListAddition(Done(name: text)));
  }

  @override
  Widget build(BuildContext context) {
    final doneList = DoneListProvider.of(context);
    return StreamBuilder(
        stream: doneList.itemCount,
        builder: (context, snapshot) => Container(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                  Row(children: <Widget>[
                    Flexible(
                      child: InputField(
                          controller: _textController,
                          handleSubmitted: (String text) =>
                              _handleSubmitted(text, doneList)),
                    ),
                    Button(
                      child: Text('DONE',
                          style: TextStyle(color: Colors.blue, fontSize: 12.0)),
                      onTap: () =>
                          _handleSubmitted(_textController.text, doneList),
                    ),
                  ]),
                  Text('${snapshot.data} items')
                ])));
  }
}
