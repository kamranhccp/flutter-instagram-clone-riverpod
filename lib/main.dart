import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:instagram_clone_kamranhccp/state/auth/backend/authenticator.dart';
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
  runApp(const MyApp());
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
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Instagram"),
      ),
      body: Column(
        children: [
          TextButton(
            onPressed: () async {
              final results = await Authenticator().loginWithGoogle();
              results.log();
            },
            child: const Text(
              "Login with Google",
            ),
          ),
          TextButton(
            onPressed: () async {
              final results = await const Authenticator().loginWithFacebook();
              results.log();
            },
            child: const Text(
              "Login with Facebook",
            ),
          ),
        ],
      ),
    );
  }
}
