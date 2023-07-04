import 'package:bloc_demo/presentation/bloc/bloc/fetch_users_bloc.dart';
import 'package:bloc_demo/presentation/screens/main_screen/components/main_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GetIt.I.get<FetchUsersBloc>()..add(const LoadUsers()),
      child: const MainView(),
    );
  }
}
