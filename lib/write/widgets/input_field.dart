import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final TextEditingController _controller;
  final void Function(String text) _handleSubmitted;
  InputField(
      {@required TextEditingController controller,
      @required void Function(String text) handleSubmitted})
      : _controller = controller,
        _handleSubmitted = handleSubmitted;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      onSubmitted: _handleSubmitted,
      decoration: new InputDecoration.collapsed(
          hintText: "Write down what you've done!!"),
    );
  }
}
