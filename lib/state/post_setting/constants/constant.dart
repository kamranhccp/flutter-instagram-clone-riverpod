import 'package:flutter/foundation.dart' show immutable;

@immutable
class Constants {
  // Strings for "allow user to like and comment on your post" when you upload a post
  static const allowLikesTitle = 'Allow Likes';
  static const allowLikesDescription =
      'By allowing likes, users will be able to press the like button on your posts.';
  static const allowLikesStorageKey = 'Allow_Likes';
  static const allowCommentsTitle = 'Allow Comments';
  static const allowCommentsDescription =
      'By allowing comments, users will be able to comment on your posts.';
  static const allowCommentsStorageKey = 'Allow_Comments';
  const Constants._();
}
