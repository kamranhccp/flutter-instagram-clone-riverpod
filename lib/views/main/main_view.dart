import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instagram_clone_kamranhccp/state/auth/providers/auth_state_provider.dart';
import 'package:instagram_clone_kamranhccp/state/image_upload/models/file_type.dart';
import 'package:instagram_clone_kamranhccp/state/post_setting/providers/post_settings_provider.dart';
import 'package:instagram_clone_kamranhccp/views/components/dialogs/alert_dialog_model.dart';
import 'package:instagram_clone_kamranhccp/views/components/dialogs/logout_dialog.dart';
import 'package:instagram_clone_kamranhccp/views/constants/strings.dart';
import 'package:instagram_clone_kamranhccp/views/create_new_post/create_new_post_view.dart';
import 'package:instagram_clone_kamranhccp/views/tabs/search/search_view.dart';

import '../../state/image_upload/helpers/image_picker_helper.dart';
import '../tabs/user_posts/user_post_view.dart';

class MainView extends ConsumerStatefulWidget {
  const MainView({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _MainViewState();
}

class _MainViewState extends ConsumerState<MainView> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(Strings.appName),
          actions: [
            IconButton(
              onPressed: () async {
                // pick a video
                final videoFile =
                    await ImagePickerHelper.pickVideoFromGallery();
                if (videoFile == null) {
                  return;
                }

                ref.refresh(postSettingProvider);

                // go to Screen to create new Post
                if (!mounted) {
                  return;
                }

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => CreateNewPostView(
                      fileToUpload: videoFile,
                      fileType: FileType.video,
                    ),
                  ),
                );
              },
              icon: Icon(
                Icons.video_camera_back_outlined,
                color: Colors.blueGrey[200],
              ),
            ),
            IconButton(
              onPressed: () async {
                // pick an  Image
                final imageFile =
                    await ImagePickerHelper.pickImageFromGallery();
                if (imageFile == null) {
                  return;
                }

                ref.refresh(postSettingProvider);

                // go to Screen to create new Post
                if (!mounted) {
                  return;
                }

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => CreateNewPostView(
                      fileToUpload: imageFile,
                      fileType: FileType.image,
                    ),
                  ),
                );
              },
              icon: Icon(
                Icons.image_outlined,
                color: Colors.blueGrey[200],
              ),
            ),
            IconButton(
              onPressed: () async {
                final shouldLogout = await const LogoutDialog()
                    .present(context)
                    .then((value) => value ?? false);
                if (shouldLogout) {
                  await ref.read(authStateProvider.notifier).logOut();
                }
              },
              icon: Icon(
                Icons.login_outlined,
                color: Colors.blueGrey[200],
              ),
            ),
          ],
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(
                  Icons.person_outline_sharp,
                ),
              ),
              Tab(
                icon: Icon(
                  Icons.manage_search,
                ),
              ),
              Tab(
                icon: Icon(
                  Icons.home_outlined,
                ),
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            UserPostView(),
            SearchView(),
            UserPostView(),
          ],
        ),
      ),
    );
  }
}
