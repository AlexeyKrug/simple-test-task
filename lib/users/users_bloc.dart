import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task_github/users/users_event.dart';
import 'package:test_task_github/data/users_repository.dart';
import 'package:test_task_github/data/users_response.dart';
import 'package:test_task_github/users/users_state.dart';

const userTabs = ['A-H', 'I-P', 'Q-Z'];


class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;
  List<UserResponse> users = List.empty();

  UserBloc(this.userRepository) : super(Loading()) {
    on<FetchUsers>((event, emit) async {
      emit(Loading());
      try {
        final users = await userRepository.getUsers();
        this.users = users;
        List<UserTab> tabs = userTabs.map((e) => createTab(e, users)).toList();
        emit(Content(tabs));
      } catch (e) {
        emit(Failed());
      }
    });

    on<SearchUsers>((event, emit) async {
      try {
        var users = this.users.where(
            (user) => user.login?.toLowerCase().contains(event.query) ?? false);
        List<UserTab> tabs =
            userTabs.map((e) => createTab(e, users.toList())).toList();
        emit(Content(tabs));
      } catch (e) {
        emit(Failed());
      }
    });
  }

  UserTab createTab(String title, List<UserResponse> users) {
    var tabChars = title.split('');
    var tabUsers = users.where((user) {
      final firstLetter = user.login![0].toUpperCase();
      return firstLetter.compareTo(tabChars[0]) >= 0 &&
          firstLetter.compareTo(tabChars[2]) <= 0;
    }).toList();
    return UserTab(title, tabUsers);
  }
}
