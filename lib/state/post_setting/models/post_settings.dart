import 'package:instagram_clone_kamranhccp/state/post_setting/constants/constant.dart';

enum PostSettings {
  allowLikes(
    title: Constants.allowLikesTitle,
    description: Constants.allowLikesDescription,
    storageKey: Constants.allowLikesStorageKey,
  ),

  allowComments(
    title: Constants.allowCommentsTitle,
    description: Constants.allowCommentsDescription,
    storageKey: Constants.allowCommentsStorageKey,
  );

  final String title;
  final String description;
  // firebase storage key
  final String storageKey;

  const PostSettings({
    required this.title,
    required this.description,
    required this.storageKey,
  });
}
