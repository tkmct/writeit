import 'package:flutter/material.dart';
import './widgets/input_field.dart';
import '../shared/bloc/done_list.dart';
import '../shared/bloc/done_list_provider.dart';
import '../shared/model/done.dart';

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
                      child: InputField(_textController,
                          (String text) => _handleSubmitted(text, doneList)),
                    ),
                    Container(
                        padding: EdgeInsets.all(8.0),
                        child: IconButton(
                            icon: Icon(Icons.send),
                            onPressed: () => _handleSubmitted(
                                _textController.text, doneList)))
                  ]),
                  Text('${snapshot.data} items')
                ])));
  }
}
