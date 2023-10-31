import 'package:api_call_using_cleanarq_di_bloc/presentation/bloc/bloc/fetch_users_bloc.dart';
import 'package:api_call_using_cleanarq_di_bloc/presentation/design/body_builder.dart';
import 'package:api_call_using_cleanarq_di_bloc/presentation/screens/main_screen/components/user_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('API call using CleanArq, DI, and Bloc')),
      body: BlocBuilder<FetchUsersBloc, FetchUsersState>(
        builder: (context, state) {
          return BodyBuilder(
            appStatus: state.appStatus,
            onCompleted: (context) {
              return ListView.builder(
                itemCount: state.users.length,
                itemBuilder: (_, index) => UserCard(user: state.users[index]),
              );
            },
          );
        },
      ),
    );
  }
}
