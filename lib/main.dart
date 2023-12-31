import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maaly_alkhayr_test_project/UI/screens/add_post_screen.dart';
import 'package:maaly_alkhayr_test_project/UI/screens/posts_screen.dart';
import 'package:maaly_alkhayr_test_project/blocs/posts/posts_bloc.dart';

import 'firebase_options.dart';

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
    return BlocProvider(
      create: (context) => PostsBloc()..add(FetchPostsEvent()),
      child: MaterialApp(
        title: 'Flutter Demo',
        home: const PostsScreen(),
        routes: {
          PostsScreen.routName: (ctx) => PostsScreen(),
          AddPostScreen.routName: (ctx) => AddPostScreen(),
        },
      ),
    );
  }
}

