import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:instagram_clone_kamranhccp/state/constants/firebase_field_names.dart';

import '../../posts/typedef/post_id.dart';
import '../../posts/typedef/user_id.dart';

@immutable
class CommentPayload extends MapView<String, dynamic> {
  CommentPayload({
    required UserId fromUserId,
    required PostId fromPostId,
    required String comment,
  }) : super({
          FirebaseFieldName.userID: fromUserId,
          FirebaseFieldName.postID: fromPostId,
          FirebaseFieldName.comment: comment,
          FirebaseFieldName.createdAt: FieldValue.serverTimestamp(),
        });
}
