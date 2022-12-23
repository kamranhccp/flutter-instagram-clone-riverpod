import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instagram_clone_kamranhccp/state/comments/models/post_comments_request.dart';
import 'package:instagram_clone_kamranhccp/state/posts/providers/specific_post_with_comment_provider.dart';
import 'package:instagram_clone_kamranhccp/views/components/comment/compact_comment_column.dart';
import 'package:instagram_clone_kamranhccp/views/components/dialogs/alert_dialog_model.dart';
import 'package:instagram_clone_kamranhccp/views/components/dialogs/delete_dialog.dart';
import 'package:instagram_clone_kamranhccp/views/components/like_button.dart';
import 'package:instagram_clone_kamranhccp/views/components/like_count_view.dart';
import 'package:instagram_clone_kamranhccp/views/components/post/post_date_view.dart';
import 'package:instagram_clone_kamranhccp/views/components/post/post_display_name_and_message_view.dart';
import 'package:instagram_clone_kamranhccp/views/components/post/post_image_or_video_view.dart';
import 'package:instagram_clone_kamranhccp/views/constants/strings.dart';
import 'package:instagram_clone_kamranhccp/views/post_comments/post_comment_view.dart';
import 'package:share_plus/share_plus.dart';

import '../../enums/date_sorting.dart';
import '../../state/post/models/post.dart';
import '../../state/posts/providers/can_current_user_delete_post_provider.dart';
import '../../state/posts/providers/delete_post_provider.dart';
import '../components/animations/small_error_animation_view.dart';

class PostDetailsView extends ConsumerStatefulWidget {
  final Post post;

  const PostDetailsView({
    Key? key,
    required this.post,
  }) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PostDetailsViewState();
}

class _PostDetailsViewState extends ConsumerState<PostDetailsView> {
  @override
  Widget build(BuildContext context) {
    final request = RequestForPostAndComment(
      postId: widget.post.postId,
      limit: 3,
      sortByCreatedAt: true,
      dateSorting: DateSorting.oldestOnTop,
    );

    // get post with comment
    final postWithComments = ref.watch(
      specificPostWithCommentsProvider(
        request,
      ),
    );

    // can we delete the post?
    final canDeletePost = ref.watch(
      canCurrentUserDeletePostProvider(
        widget.post,
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          Strings.postDetails,
        ),
        actions: [
          // shared button
          postWithComments.when(
            data: (post) {
              return IconButton(
                onPressed: () {
                  final url = postWithComments.value!.post.fileUrl;
                  Share.share(
                    url,
                    subject: Strings.checkOutThisPost,
                  );
                },
                icon: const Icon(
                  Icons.share_outlined,
                ),
              );
            },
            error: (error, stackTrace) {
              return const SmallErrorAnimationView();
            },
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
          ),

          // if user can delete the post, show delete button
          if (canDeletePost.value ?? false)
            IconButton(
              icon: const Icon(
                Icons.delete_forever,
              ),
              onPressed: () async {
                final shouldDeletePost = await const DeleteDialog(
                  titleOfObjectToDelete: Strings.post,
                )
                    .present(context)
                    .then((shouldDelete) => shouldDelete ?? false);
                if (shouldDeletePost) {
                  await ref
                      .read(
                        deletePostProvider.notifier,
                      )
                      .deletePost(
                        post: widget.post,
                      );
                  if (mounted) {
                    Navigator.of(context).pop();
                  }
                }
              },
            )
        ],
      ),
      body: postWithComments.when(
        data: (postWithComments) {
          final postId = postWithComments.post.postId;

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                PostImageOrVideoView(
                  post: postWithComments.post,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // like button if post is allows to be liked
                    if (postWithComments.post.allowLikes)
                      LikeButton(
                        postId: postId,
                      ),
                    // comment button if post is allows to be commented
                    if (postWithComments.post.allowComments)
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => PostCommentsView(
                                postId: postId,
                              ),
                            ),
                          );
                        },
                        icon: const Icon(
                          Icons.comment_rounded,
                        ),
                      ),
                  ],
                ),
                // post details and divider
                Padding(
                  padding: const EdgeInsets.only(
                    left: 8.0,
                    top: 5.0,
                    bottom: 5.0,
                  ),
                  child: PostDisplayNameAndMessageView(
                    post: postWithComments.post,
                  ),
                ),
                PostDateView(
                  dateTime: postWithComments.post.createdAt,
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Divider(),
                ),
                CompactCommentColumn(
                  comments: postWithComments.comments,
                ),
                if (postWithComments.post.allowLikes)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        LikeCountView(
                          postId: postId,
                        ),
                      ],
                    ),
                  ),
                // add some space at the bottom
                const SizedBox(
                  height: 100,
                ),
              ],
            ),
          );
        },
        error: (error, stackTrace) {
          return const SmallErrorAnimationView();
        },
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
