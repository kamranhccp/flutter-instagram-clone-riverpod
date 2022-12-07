import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instagram_clone_kamranhccp/state/auth/providers/auth_state_provider.dart';
import 'package:instagram_clone_kamranhccp/state/auth/providers/is_logged_in_provider.dart';
import 'package:instagram_clone_kamranhccp/views/components/loading/loading_screen.dart';
import 'firebase_options.dart';

import 'dart:developer' as developer show log;

extension Log on Object {
  void log() => developer.log(toString());
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark(),
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
      ),
      themeMode: ThemeMode.dark,
      home: Consumer(
        builder: (context, ref, watch) {
          final isLoggedIn = ref.watch(isLoggedInProvider);
          isLoggedIn.log();
          if (isLoggedIn) {
            return const MainView();
          } else {
            return const LoginView();
          }
        },
      ),
    );
  }
}

// when you are already logged in
class MainView extends StatelessWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Main View"),
      ),
      body: Consumer(
        builder: (context, ref, watch) {
          return TextButton(
            onPressed: () async {
              await ref.read(authStateProvider.notifier).logOut();
            },
            child: const Text(
              "Logout",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          );
        },
      ),
    );
  }
}

// when you are not logged in
class LoginView extends ConsumerWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Login View",
        ),
      ),
      body: Column(
        children: [
          TextButton(
            onPressed: ref.read(authStateProvider.notifier).loginWithGoogle,
            child: const Text(
              "Login with Google",
            ),
          ),
          TextButton(
            onPressed: ref.read(authStateProvider.notifier).loginWithFacebook,
            child: const Text(
              "Login with Facebook",
            ),
          ),
        ],
      ),
    );
  }
}
