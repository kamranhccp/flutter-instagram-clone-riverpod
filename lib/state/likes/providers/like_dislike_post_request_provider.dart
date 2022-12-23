import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instagram_clone_kamranhccp/state/constants/firebase_collection_names.dart';
import 'package:instagram_clone_kamranhccp/state/constants/firebase_field_names.dart';
import 'package:instagram_clone_kamranhccp/state/likes/models/like.dart';

import '../models/like_dislike_request.dart';

final likeDislikePostProvider =
    FutureProvider.family.autoDispose<bool, LikeDislikeRequest>(
  (
    ref,
    LikeDislikeRequest request,
  ) async {
    final query = FirebaseFirestore.instance
        .collection(FirebaseCollectionName.likes)
        .where(
          FirebaseFieldName.postID,
          isEqualTo: request.postId,
        )
        .where(
          FirebaseFieldName.userID,
          isEqualTo: request.likedBy,
        )
        .get();

    // if the user has already liked the post, then unlike it
    final hasLiked = await query.then(
      (snapshot) => snapshot.docs.isNotEmpty,
    );

    if (hasLiked) {
      // delete the like from the database - firestore
      try {
        await query.then(
          (snapshot) async {
            for (final doc in snapshot.docs) {
              await doc.reference.delete();
            }
          },
        );
        return true;
      } catch (_) {
        return false;
      }
    } else {
      // post a like object
      final like = Like(
        postId: request.postId,
        likedBy: request.likedBy,
        date: DateTime.now(),
      );
      try {
        await FirebaseFirestore.instance
            .collection(
              FirebaseCollectionName.likes,
            )
            .add(like);
        return true;
      } catch (_) {
        return false;
      }
    }
  },
);
