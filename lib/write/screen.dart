import 'package:flutter/material.dart';

class WriteScreen extends StatelessWidget {
  final TextEditingController _textController = TextEditingController();
  void _handleSubmitted(String text) {
    _textController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(children: <Widget>[
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
                  onPressed: () => _handleSubmitted(_textController.text)))
        ]));
  }
}
