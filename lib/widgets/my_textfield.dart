import 'package:flutter/material.dart';
import 'package:keyboard_actions/keyboard_actions.dart';

class MyTextfield extends StatefulWidget {
  const MyTextfield({super.key});

  @override
  State<MyTextfield> createState() => _MyTextfieldState();
}

class _MyTextfieldState extends State<MyTextfield> {
  late final FocusNode _focusNode;
  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardActions(
      config: KeyboardActionsConfig(
        keyboardActionsPlatform: KeyboardActionsPlatform.IOS,
        actions: [
          KeyboardActionsItem(
            displayArrows: false,
            focusNode: _focusNode,
            toolbarButtons: [
              (node) => GestureDetector(
                onTap: () => node.unfocus(),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text("done", style: TextStyle(color: Colors.black)),
                ),
              ),
            ],
          ),
        ],
      ),
      child: TextField(focusNode: _focusNode,),
    );
  }
}
