import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instagram_clone_kamranhccp/state/comments/extensions/comment_sorting_by_request.dart';
import 'package:instagram_clone_kamranhccp/state/comments/models/comment.dart';
import 'package:instagram_clone_kamranhccp/state/comments/models/post_comments_request.dart';
import 'package:instagram_clone_kamranhccp/state/constants/firebase_collection_names.dart';
import 'package:instagram_clone_kamranhccp/state/constants/firebase_field_names.dart';

final postCommentProvider = StreamProvider.family
    .autoDispose<Iterable<Comment>, RequestForPostAndComment>((
  ref,
  RequestForPostAndComment request,
) {
  final controller = StreamController<Iterable<Comment>>();

  final sub = FirebaseFirestore.instance
      .collection(FirebaseCollectionName.comments)
      .where(
        FirebaseFieldName.postID,
        isEqualTo: request.postId,
      )
      .snapshots()
      .listen((snapshot) {
    final documents = snapshot.docs;
    final limitedDocuments =
        request.limit != null ? documents.take(request.limit!) : documents;
    final comments = limitedDocuments
        .where(
          (doc) => !doc.metadata.hasPendingWrites,
        )
        .map(
          (document) => Comment(
            id: document.id,
            document.data(),
          ),
        );
    final results = comments.applySortingFrom(request);
    controller.sink.add(results);
  });
  ref.onDispose(() {
    sub.cancel();
    controller.close();
  });
  return controller.stream;
});
