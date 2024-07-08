import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task_github/users/user_tab_widget.dart';
import 'package:test_task_github/users/users_bloc.dart';
import 'package:test_task_github/users/users_event.dart';
import 'package:test_task_github/users/users_state.dart';

class ScreenWidget extends StatelessWidget {
  const ScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(builder: (context, state) {
      var state = context.read<UserBloc>().state;
      switch (state) {
        case Loading():
          return const Center(child: CircularProgressIndicator());
        case Content():
          return homePageContent(state, context);
        case Failed():
          return const Center(
            child: Text('ERROR'),
          );
      }
    });
  }

  Widget homePageContent(Content usersLoaded, BuildContext context) {
    return DefaultTabController(
      length: usersLoaded.usersTabs.length,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size(double.infinity, 50),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: TextField(
                keyboardType: TextInputType.multiline,
                onChanged: (value) =>
                    context.read<UserBloc>().add(SearchUsers(value)),
                onTapOutside: (event) {
                  FocusScope.of(context).requestFocus(FocusNode());
                },
                decoration: const InputDecoration(
                  suffixIcon: Icon(Icons.search),
                ),
              ),
            ),
          ),
        ),
        body: Column(
          children: [
            TabBar(
              labelColor: Colors.black,
              tabs: [
                for (final tab in usersLoaded.usersTabs)
                  Tab(text: tab.tabTitle)
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  for (final tab in usersLoaded.usersTabs)
                    UserTabWidget(tab.users)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}