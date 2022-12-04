import 'dart:collection';
import 'package:flutter/foundation.dart' show immutable;
import 'package:instagram_clone_kamranhccp/state/constants/firebase_field_names.dart';
import 'package:instagram_clone_kamranhccp/state/posts/typedef/user_id.dart';

@immutable
class UserInfoPayload extends MapView<String, String> {
  UserInfoPayload({
    required UserId userId,
    required String? displayName,
    required String? email,
  }) : super(
          {
            FirebaseFieldName.userID: userId,
            FirebaseFieldName.displayName: displayName ?? '',
            FirebaseFieldName.email: email ?? '',
          },
        );
}
