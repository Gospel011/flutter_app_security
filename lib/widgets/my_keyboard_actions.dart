import 'package:flutter/material.dart';
import 'package:keyboard_actions/keyboard_actions.dart';

class MyKeyboardActions extends StatelessWidget {
  const MyKeyboardActions({
    super.key,
    required List<FocusNode> focusNodes,
    this.displayDoneButton = true,
    required this.child,
  }) : _focusNodes = focusNodes;

  final List<FocusNode> _focusNodes;
  final bool displayDoneButton;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return KeyboardActions(
      config: KeyboardActionsConfig(
        keyboardActionsPlatform: KeyboardActionsPlatform.IOS,
        actions: [
          ..._focusNodes.map((currentNode) {
            return KeyboardActionsItem(
              displayArrows: false,
              focusNode: currentNode,
              displayDoneButton: false,
              toolbarButtons: [
                if (displayDoneButton)
                  (node) => GestureDetector(
                    onTap: () => node.unfocus(),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        "done",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
              ],
            );
          }),
        ],
      ),
      child: child,
    );
  }
}
