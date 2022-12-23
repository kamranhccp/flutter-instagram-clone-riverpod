import 'package:flutter/material.dart';
import 'package:instagram_clone_kamranhccp/state/post/models/post.dart';
import 'package:instagram_clone_kamranhccp/views/components/post/post_image_view.dart';
import 'package:instagram_clone_kamranhccp/views/components/post/post_video_view.dart';

import '../../../state/image_upload/models/file_type.dart';

class PostImageOrVideoView extends StatelessWidget {
  final Post post;

  const PostImageOrVideoView({
    required this.post,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (post.fileType) {
      case FileType.image:
        return PostImageView(
          post: post,
        );
      case FileType.video:
        return PostVideoView(
          post: post,
        );
      default:
        return const SizedBox();
    }
  }
}
