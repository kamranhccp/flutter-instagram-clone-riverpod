import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instagram_clone_kamranhccp/state/auth/providers/auth_state_provider.dart';
import 'package:instagram_clone_kamranhccp/views/components/dialogs/alert_dialog_model.dart';
import 'package:instagram_clone_kamranhccp/views/components/dialogs/logout_dialog.dart';
import 'package:instagram_clone_kamranhccp/views/constants/strings.dart';

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
              onPressed: () async {},
              icon: const Icon(
                Icons.video_camera_back_outlined,
                color: Colors.lightBlue,
              ),
            ),
            IconButton(
              onPressed: () async {},
              icon: const Icon(
                Icons.image_outlined,
                color: Colors.lightBlue,
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
              icon: const Icon(
                Icons.login_outlined,
                color: Colors.lightBlue,
              ),
            ),
          ],
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(
                  Icons.person_outline_sharp,
                  color: Colors.greenAccent,
                ),
              ),
              Tab(
                icon: Icon(
                  Icons.manage_search,
                  color: Colors.greenAccent,
                ),
              ),
              Tab(
                icon: Icon(
                  Icons.home_outlined,
                  color: Colors.greenAccent,
                ),
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            UserPostView(),
            UserPostView(),
            UserPostView(),
          ],
        ),
      ),
    );
  }
}
