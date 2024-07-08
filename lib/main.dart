import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task_github/data/users_repository.dart';
import 'package:test_task_github/screen_widget.dart';
import 'package:test_task_github/users/users_bloc.dart';
import 'package:test_task_github/users/users_event.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => UserBloc(UserRepository())..add(FetchUsers()),
        child: const ScreenWidget(),
      ),
    );
  }
}


