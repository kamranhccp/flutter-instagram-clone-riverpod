import 'package:flutter/foundation.dart' show immutable;

@immutable
class Strings {
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
