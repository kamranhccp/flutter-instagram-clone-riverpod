import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instagram_clone_kamranhccp/views/components/animations/empty_contents_with_text_animation_view.dart';
import 'package:instagram_clone_kamranhccp/views/components/animations/error_animation_view.dart';
import 'package:instagram_clone_kamranhccp/views/components/animations/loading_animation_view.dart';
import 'package:instagram_clone_kamranhccp/views/constants/strings.dart';

import '../../../state/posts/providers/user_posts_provider.dart';
import '../../components/post/post_grid_view.dart';

class UserPostView extends ConsumerWidget {
  const UserPostView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final posts = ref.watch(userPostsProvider);
    return RefreshIndicator(
      onRefresh: () {
        ref.refresh(userPostsProvider);
        return Future.delayed(
          const Duration(
            seconds: 1,
          ),
        );
      },
      child: posts.when(
        data: (posts) {
          if (posts.isEmpty) {
            return const EmptyContentsWithTextAnimationView(
              text: Strings.youHaveNoPosts,
            );
          } else {
            return PostGridView(
              posts: posts,
            );
          }
        },
        error: (error, stackTrace) {
          return const ErrorAnimationView();
        },
        loading: () {
          return const LoadingAnimationView();
        },
      ),
    );
  }
}
