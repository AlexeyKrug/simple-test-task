import 'package:test_task_github/data/users_response.dart';

sealed class UserState {}

class Loading extends UserState {}

class Content extends UserState {
  final List<UserTab> usersTabs;

  Content(this.usersTabs);
}

class Failed extends UserState {}

class UserTab {
  String tabTitle;
  List<UserResponse> users;

  UserTab(this.tabTitle, this.users);
}
