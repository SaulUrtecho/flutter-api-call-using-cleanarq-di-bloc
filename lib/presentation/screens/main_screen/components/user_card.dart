import 'package:bloc_demo/domain/entities/user_entity.dart';
import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  final UserEntity user;

  const UserCard({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      child: Card(
        color: Theme.of(context).primaryColor,
        child: ListTile(
          title: Text(
            '${user.firstName}  ${user.lastName}',
            style: const TextStyle(color: Colors.white),
          ),
          subtitle: Text(
            '${user.email}',
            style: const TextStyle(color: Colors.white),
          ),
          leading: CircleAvatar(
            backgroundImage: NetworkImage(user.avatar.toString()),
          ),
        ),
      ),
    );
  }
}
