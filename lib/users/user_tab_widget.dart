import 'package:flutter/material.dart';
import 'package:test_task_github/data/users_response.dart';

class UserTabWidget extends StatelessWidget {
  final List<UserResponse> userList;
  const UserTabWidget(this.userList, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: userList.length,
        itemBuilder: (_, index) {
          var user = userList[index];
          return Padding(
            padding: const EdgeInsets.symmetric(
                vertical: 4, horizontal: 8),
            child: ListTile(
              title: Text(
                user.login ?? '',
              ),
              subtitle: Text(
                'Followers: ${user.followersUrl?.length} / Following ${user.followingUrl?.length}',
              ),
              leading: CircleAvatar(
                backgroundImage: NetworkImage(
                    user.avatarUrl.toString()),
              ),
            ),
          );
        });
  }
}
