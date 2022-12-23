import 'dart:collection';

import 'package:flutter/foundation.dart' show immutable;
import 'package:instagram_clone_kamranhccp/state/constants/firebase_field_names.dart';

import '../../posts/typedef/post_id.dart';
import '../../posts/typedef/user_id.dart';

@immutable
class Like extends MapView<String, String> {
  Like({
    required PostId postId,
    required UserId likedBy,
    required DateTime date,
  }) : super(
          {
            FirebaseFieldName.postID: postId,
            FirebaseFieldName.userID: likedBy,
            FirebaseFieldName.date: date.toIso8601String(),
          },
        );
}
