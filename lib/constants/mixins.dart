import 'package:haptic_feedback/haptic_feedback.dart';

mixin HapticMixin {
  void vibrate(HapticsType type) async {
    final canVibrate = await Haptics.canVibrate();

    if (!canVibrate) {
      print("DEVICE CANNOT VIBRATE");
      return;
    }

    for (var hapticType in HapticsType.values) {
      if (hapticType == type) await Haptics.vibrate(hapticType);
    }
  }
}
