import 'package:flutter/foundation.dart' show immutable;

@immutable
class Strings {
  // Strings for "allow user to like and comment on your post" when you upload a post
  static const allowLikesTitle = 'Allow Likes';
  static const allowLikesDescription =
      'By allowing likes, users will be able to press the like button on your posts.';
  static const allowLikesStorageKey = 'Allow_Likes';
  static const allowCommentsTitle = 'Allow Comments';
  static const allowCommentsDescription =
      'By allowing comments, users will be able to comment on your posts.';
  static const allowCommentsStorageKey = 'Allow_Comments';

  static const comment = 'Comment';
  static const loading = 'Loading...';

  static const person = 'Person';
  static const people = 'People';
  static const likedThis = 'Liked this';

  // strings to confirm delete
  static const delete = 'Delete';
  static const areYouSureYouWantToDeleteThis =
      'Are you sure you want to delete this';

  // Strings for LogOut and Cancel
  static const logOut = 'Log Out';
  static const areYouSureYouWantToLogOutOfTheApp =
      'Are you sure you want to log out of the app?';
  static const cancel = 'Cancel';

  const Strings._();
}
