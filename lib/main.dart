import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laboratory_work_7/profile/pages/start_page.dart';
import 'bloc/post_bloc.dart';
import 'repository/post_repository.dart';
import 'screens/posts_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final PostRepository repository = PostRepository();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Registration App',
      debugShowCheckedModeBanner: false,
      home: const StartPage(),
    );
  }
}
