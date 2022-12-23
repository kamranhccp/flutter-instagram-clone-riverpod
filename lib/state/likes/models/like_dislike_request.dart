import 'package:flutter/foundation.dart' show immutable;

import '../../posts/typedef/post_id.dart';
import '../../posts/typedef/user_id.dart';

@immutable
class LikeDislikeRequest {
  final PostId postId;
  final UserId likedBy;

  const LikeDislikeRequest({
    required this.postId,
    required this.likedBy,
  });
}
