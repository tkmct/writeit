import 'package:flutter/material.dart';
import '../bloc/done_list.dart';
import '../model/done.dart';

class WriteScreen extends StatelessWidget {
  final TextEditingController _textController = TextEditingController();
  final doneList = DoneListBloc();
  void _handleSubmitted(String text) {
    _textController.clear();
    doneList.doneListAddition.add(DoneListAddition(Done(text)));
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: doneList.itemCount,
        builder: (context, snapshot) => Container(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                  Row(children: <Widget>[
                    Flexible(
                        child: TextField(
                      controller: _textController,
                      onSubmitted: _handleSubmitted,
                      decoration: new InputDecoration.collapsed(
                          hintText: "Write down what you've done!!"),
                    )),
                    Container(
                        padding: EdgeInsets.all(8.0),
                        child: IconButton(
                            icon: Icon(Icons.send),
                            onPressed: () =>
                                _handleSubmitted(_textController.text)))
                  ]),
                  Text('${snapshot.data} items')
                ])));
  }
}
