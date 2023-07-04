import 'package:bloc_demo/domain/entities/user_entity.dart';
import 'package:bloc_demo/presentation/bloc/bloc/fetch_users_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('API call using CleanArq, DI, and Bloc')),
      body: BlocBuilder<FetchUsersBloc, FetchUsersState>(builder: (context, state) {
        switch (state.appStatus) {
          case AppStatus.loading:
            return const Center(child: CircularProgressIndicator());
          case AppStatus.failure:
          case AppStatus.completed:
            List<UserEntity> userList = state.users;
            return Center(
              child: ListView.builder(
                itemCount: userList.length,
                itemBuilder: (_, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    child: Card(
                      color: Theme.of(context).primaryColor,
                      child: ListTile(
                        title: Text(
                          '${userList[index].firstName}  ${userList[index].lastName}',
                          style: const TextStyle(color: Colors.white),
                        ),
                        subtitle: Text(
                          '${userList[index].email}',
                          style: const TextStyle(color: Colors.white),
                        ),
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(userList[index].avatar.toString()),
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
        }
      }),
    );
  }
}
