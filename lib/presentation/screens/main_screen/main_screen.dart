import 'package:api_call_using_cleanarq_di_bloc/core/app_status.dart';
import 'package:api_call_using_cleanarq_di_bloc/presentation/screens/main_screen/bloc/fetch_characters_bloc.dart';
import 'package:api_call_using_cleanarq_di_bloc/presentation/screens/main_screen/components/character_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          GetIt.I.get<FetchCharactersBloc>()..add(const LoadCharacters()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Dragon Ball Characters'),
          backgroundColor: Colors.amber,
        ),
        body: BlocBuilder<FetchCharactersBloc, FetchCharactersState>(
          builder: (context, state) {
            switch (state.appStatus) {
              case AppStatus.loading:
                return const Center(child: CircularProgressIndicator());
              case AppStatus.failure:
                return const SizedBox.shrink();
              case AppStatus.completed:
                return ListView.builder(
                  itemCount: state.characters.length,
                  itemBuilder: (_, index) =>
                      CharacterCard(character: state.characters[index]),
                );
            }
          },
        ),
      ),
    );
  }
}
