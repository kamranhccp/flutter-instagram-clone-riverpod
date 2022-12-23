import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instagram_clone_kamranhccp/state/providers/image_uploader_provider.dart';

import '../auth/providers/auth_state_provider.dart';
import '../comments/providers/delete_comment_provider.dart';
import '../comments/providers/send_comment_provider.dart';
import '../posts/providers/delete_post_provider.dart';

final isLoadingProvider = Provider<bool>(
  (ref) {
    final authState = ref.watch(authStateProvider);
    final isUploadingImage = ref.watch(imageUploaderProvider);
    final isSendingComment = ref.watch(sendCommentProvider);
    final isDeletingComment = ref.watch(deleteCommentProvider);
    final isDeletingPost = ref.watch(deletePostProvider);

    return authState.isLoading ||
        isUploadingImage ||
        isSendingComment ||
        isDeletingComment ||
        isDeletingPost;
  },
);
