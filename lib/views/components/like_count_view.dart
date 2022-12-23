import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instagram_clone_kamranhccp/state/posts/typedef/post_id.dart';

import '../../state/likes/providers/post_like_count_provider.dart';
import 'animations/small_error_animation_view.dart';
import 'constants/strings.dart';

class LikeCountView extends ConsumerWidget {
  final PostId postId;

  const LikeCountView({
    Key? key,
    required this.postId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final likeCount = ref.watch(
      postLikeCountProvider(
        postId,
      ),
    );
    return likeCount.when(
      data: (int likesCount) {
        final peopleOrPeople =
            likesCount == 1 ? Strings.person : Strings.people;
        final likesText = '$likesCount $peopleOrPeople ${Strings.likedThis}';
        return Text(
          likesText,
        );
      },
      error: (error, stackTrace) {
        return const SmallErrorAnimationView();
      },
      loading: () {
        return const CircularProgressIndicator();
      },
    );
  }
}
