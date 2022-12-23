import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instagram_clone_kamranhccp/state/image_upload/typedefs/is_loading.dart';
import 'package:instagram_clone_kamranhccp/state/posts/typedef/post_id.dart';
import 'package:instagram_clone_kamranhccp/state/posts/typedef/user_id.dart';

import '../../constants/firebase_collection_names.dart';
import '../models/comment_payload.dart';

class SendCommentNotifier extends StateNotifier<IsLoading> {
  SendCommentNotifier() : super(false);

  set isLoading(bool value) => state = value;

  Future<bool> sendComment({
    required UserId userId,
    required PostId onPostId,
    required String comment,
  }) async {
    isLoading = true;

    final payLoad = CommentPayload(
      fromUserId: userId,
      fromPostId: onPostId,
      comment: comment,
    );
    try {
      await FirebaseFirestore.instance
          .collection(FirebaseCollectionName.comments)
          .add(payLoad);
      return true;
    } catch (_) {
      return false;
    } finally {
      isLoading = false;
    }
  }
}
