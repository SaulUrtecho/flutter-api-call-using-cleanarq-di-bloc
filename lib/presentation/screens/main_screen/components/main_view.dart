import 'package:api_call_using_cleanarq_di_bloc/presentation/bloc/bloc/fetch_characters_bloc.dart';
import 'package:api_call_using_cleanarq_di_bloc/presentation/design/body_builder.dart';
import 'package:api_call_using_cleanarq_di_bloc/presentation/screens/main_screen/components/character_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dragon Ball Characters'),
        backgroundColor: Colors.amber,
      ),
      body: BlocBuilder<FetchCharactersBloc, FetchCharactersState>(
        builder: (context, state) {
          return BodyBuilder(
            appStatus: state.appStatus,
            onCompleted: (context) {
              return ListView.builder(
                itemCount: state.characters.length,
                itemBuilder: (_, index) =>
                    CharacterCard(character: state.characters[index]),
              );
            },
          );
        },
      ),
    );
  }
}
