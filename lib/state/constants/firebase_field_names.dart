import 'package:flutter/foundation.dart' show immutable;

@immutable
class FirebaseFieldName {
  static const userID = 'uid';
  static const postID = 'post_id';
  static const comment = 'comment';
  static const createdAt = 'created_at';
  static const date = 'date';
  static const displayName = 'display_name';
  static const email = 'email';

  const FirebaseFieldName._();
}
