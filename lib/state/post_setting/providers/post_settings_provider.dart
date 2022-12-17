import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/post_settings.dart';
import '../notifiers/post_setting_notifier.dart';

final postSettingProvider =
    StateNotifierProvider<PostSettingNotifier, Map<PostSettings, bool>>(
  (ref) => PostSettingNotifier(),
);
