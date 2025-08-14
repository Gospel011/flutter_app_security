import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:haptic_feedback/haptic_feedback.dart';
import 'package:keyboard_actions/keyboard_actions.dart';
import 'package:security_test/constants/enums.dart';
import 'package:security_test/constants/env_keys.dart';
import 'package:security_test/constants/mixins.dart';
import 'package:security_test/widgets/my_keyboard_actions.dart';
import 'package:security_test/widgets/my_textfield.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with HapticMixin {
  late final AppLifecycleListener _listener;
  bool blur = false;
  late final FocusNode _focusNode;
  late final FocusNode _focusNode_2;
  late final FocusNode _focusNode_3;
  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode_2 = FocusNode();
    _focusNode_3 = FocusNode();

    _listener = AppLifecycleListener(
      onResume: () {
        print(
          "RESUMED",
        ); // when home button is pressed / when replaced by another app
        unblurScreen();
      },
      onInactive: () {
        print(
          "INACTIVE",
        ); // when home button is pressed / when replaced by another app
        blurScreen();
      },
      onHide: () {
        print(
          "HIDDEN",
        ); // when home button is pressed / when replaced by another app
        blurScreen();
      },
      onShow: () {
        print("SHOW"); //
      },
      onPause: () {
        print(
          "PAUSED",
        ); // when home button is pressed / when replaced by another app
      },
      onRestart: () {
        print("RESTARTED"); // when app is reopened
      },
      onDetach: () {
        print("DETACHED");
      }, // didn't see this one
    );
  }

  void blurScreen() {
    setState(() {
      blur = true;
    });
  }

  void unblurScreen() {
    setState(() {
      blur = false;
    });
  }

  @override
  void dispose() {
    _listener.dispose();
    _focusNode.dispose();
    _focusNode_2.dispose();
    _focusNode_3.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: blur ? 0 : 1,
      duration: Duration(milliseconds: 300),
      child: MaterialApp(
        title: 'Material App',
        home: Scaffold(
          appBar: AppBar(title: const Text('Material App Bar')),
          body: MyKeyboardActions(
            focusNodes: [_focusNode, _focusNode_2, _focusNode_3],
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 16),

                  Text('App Env: ${EnvKeys.getKey(EnvKeyTypes.env)}'),
                  Text('App Name: ${EnvKeys.getKey(EnvKeyTypes.appName)}'),
                  Text(
                    'App Version: ${EnvKeys.getKey(EnvKeyTypes.appVersion)}',
                  ),
                  Text('Map runtimeType: ${{"A": "B"}.runtimeType}'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 10,
                    children: [
                      ElevatedButton(
                        onLongPress: () {
                          print("LONG PRESSED");
                        },
                        onPressed: () {
                          // FlutterWindowManager.addFlags(
                          //     FlutterWindowManager.FLAG_BLUR_BEHIND);

                          HapticFeedback.lightImpact();
                        },
                        child: Text("Light impact"),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // FlutterWindowManager.addFlags(
                          //     FlutterWindowManager.FLAG_BLUR_BEHIND);

                          vibrate(HapticsType.light);
                        },
                        child: Text("Vibrate Light impact"),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 10,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          // FlutterWindowManager.addFlags(
                          //     FlutterWindowManager.FLAG_BLUR_BEHIND);

                          HapticFeedback.mediumImpact();
                        },
                        child: Text("Medium impact"),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // FlutterWindowManager.addFlags(
                          //     FlutterWindowManager.FLAG_BLUR_BEHIND);

                          vibrate(HapticsType.medium);
                        },
                        child: Text("Vibrate Medium impact"),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 10,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          // FlutterWindowManager.addFlags(
                          //     FlutterWindowManager.FLAG_BLUR_BEHIND);

                          HapticFeedback.heavyImpact();
                        },
                        child: Text("Heavy impact"),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // FlutterWindowManager.addFlags(
                          //     FlutterWindowManager.FLAG_BLUR_BEHIND);

                          vibrate(HapticsType.heavy);
                        },
                        child: Text("Vibrate Heavy impact"),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          // FlutterWindowManager.addFlags(
                          //     FlutterWindowManager.FLAG_BLUR_BEHIND);

                          HapticFeedback.selectionClick();
                        },
                        child: Text("Selection Click"),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // FlutterWindowManager.addFlags(
                          //     FlutterWindowManager.FLAG_BLUR_BEHIND);

                          vibrate(HapticsType.selection);
                        },
                        child: Text("Vibrate Selection Click"),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // FlutterWindowManager.addFlags(
                      //     FlutterWindowManager.FLAG_BLUR_BEHIND);

                      HapticFeedback.vibrate();
                    },
                    child: Text("Vibrate"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // FlutterWindowManager.addFlags(
                      //     FlutterWindowManager.FLAG_BLUR_BEHIND);

                      vibrate(HapticsType.rigid);
                    },
                    child: Text("Vibrate rigid"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // FlutterWindowManager.addFlags(
                      //     FlutterWindowManager.FLAG_BLUR_BEHIND);

                      vibrate(HapticsType.soft);
                    },
                    child: Text("Vibrate soft"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // FlutterWindowManager.addFlags(
                      //     FlutterWindowManager.FLAG_BLUR_BEHIND);

                      vibrate(HapticsType.success);
                    },
                    child: Text("Vibrate success"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // FlutterWindowManager.addFlags(
                      //     FlutterWindowManager.FLAG_BLUR_BEHIND);

                      vibrate(HapticsType.warning);
                    },
                    child: Text("Vibrate warning"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // FlutterWindowManager.addFlags(
                      //     FlutterWindowManager.FLAG_BLUR_BEHIND);

                      vibrate(HapticsType.error);
                    },
                    child: Text("Vibrate error"),
                  ),

                  SizedBox(height: 24),

                  // MyTextfield(),
                  TextField(focusNode: _focusNode),
                  TextField(focusNode: _focusNode_2),
                  TextField(focusNode: _focusNode_3),

                  SizedBox(height: 64),
                ],
              ),
            ),
          ),
        ),
      ),
    ); //✓ Built build/app/outputs/flutter-apk/app-release.apk (18.3MB)
  }
}
