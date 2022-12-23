import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instagram_clone_kamranhccp/views/components/animations/data_not_found_animation_view.dart';
import 'package:instagram_clone_kamranhccp/views/components/animations/empty_contents_with_text_animation_view.dart';
import 'package:instagram_clone_kamranhccp/views/components/post/post_grid_view.dart';
import 'package:instagram_clone_kamranhccp/views/constants/strings.dart';

import '../../state/posts/providers/post_by_search_term_provider.dart';
import 'animations/small_error_animation_view.dart';

class SearchGridView extends ConsumerWidget {
  final String searchTerm;

  const SearchGridView({
    Key? key,
    required this.searchTerm,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (searchTerm.isEmpty) {
      return const Center(
        child: EmptyContentsWithTextAnimationView(
          text: Strings.enterYourSearchTerm,
        ),
      );
    }

    final posts = ref.watch(
      postsBySearchTermProvider(
        searchTerm,
      ),
    );
    return posts.when(
      data: (posts) => posts.isEmpty
          ? const Center(
              child: DataNotFoundAnimationView(),
            )
          : PostGridView(
              posts: posts,
            ),
      error: (error, stackTrace) {
        return const SmallErrorAnimationView();
      },
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
