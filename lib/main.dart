import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:security_test/constants/enums.dart';
import 'package:security_test/constants/env_keys.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final AppLifecycleListener _listener;
  bool blur = false;
  @override
  void initState() {
    super.initState();

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
        print(
          "SHOW",
        ); //
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
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('App Env: ${EnvKeys.getKey(EnvKeyTypes.env)}'),
                Text('App Name: ${EnvKeys.getKey(EnvKeyTypes.appName)}'),
                Text('App Version: ${EnvKeys.getKey(EnvKeyTypes.appVersion)}'),
                Text('Map runtimeType: ${{"A": "B"}.runtimeType}'),
                ElevatedButton(
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

                    HapticFeedback.mediumImpact();
                  },
                  child: Text("Medium impact"),
                ),
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

                    HapticFeedback.selectionClick();
                  },
                  child: Text("Selection Click"),
                ),
                ElevatedButton(
                  onPressed: () {
                    // FlutterWindowManager.addFlags(
                    //     FlutterWindowManager.FLAG_BLUR_BEHIND);

                    HapticFeedback.vibrate();
                  },
                  child: Text("Vibrate"),
                ),
              ],
            ),
          ),
        ),
      ),
    ); //✓ Built build/app/outputs/flutter-apk/app-release.apk (18.3MB)
  }
}
