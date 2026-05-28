import 'package:api_call_using_cleanarq_di_bloc/core/app_status.dart';
import 'package:api_call_using_cleanarq_di_bloc/core/styles.dart';
import 'package:api_call_using_cleanarq_di_bloc/presentation/screens/details_screen/bloc/character_details_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class CharacterDetailsScreen extends StatelessWidget {
  final int id;

  const CharacterDetailsScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          GetIt.I.get<CharacterDetailsBloc>()..add(LoadCharactersDetails(id)),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Character Details'),
          backgroundColor: Colors.amber,
        ),
        body: BlocBuilder<CharacterDetailsBloc, CharacterDetailsState>(
          builder: (context, state) {
            switch (state.appStatus) {
              case AppStatus.loading:
                return const Center(child: CircularProgressIndicator());
              case AppStatus.failure:
                return const Center(
                  child: Text('Failed to load character details'),
                );
              case AppStatus.completed:
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  spacing: 12,
                  children: [
                    Container(
                      height: MediaQuery.sizeOf(context).height * 0.25,
                      color: Colors.orange,
                      alignment: Alignment.center,
                      child: CircleAvatar(
                        radius: 80,
                        backgroundImage: NetworkImage(
                          state.character?.image ?? '',
                        ),
                      ),
                    ),
                    SizedBox(height: 12),
                    Text(
                      'Name: ${state.character?.name ?? 'N/A'}',
                      style: boldStyle,
                    ),
                    SizedBox(height: 12),
                    Text(
                      'Gender: ${state.character?.gender ?? 'N/A'}',
                      style: boldStyle,
                    ),
                    SizedBox(height: 12),
                    Text(
                      'Affiliation: ${state.character?.affiliation ?? 'N/A'}',
                      style: boldStyle,
                    ),
                    SizedBox(height: 12),
                    Text(
                      'Max Ki: ${state.character?.maxKi ?? 'N/A'}',
                      style: boldStyle,
                    ),
                    SizedBox(height: 12),
                    Text(
                      'Race: ${state.character?.race ?? 'N/A'}',
                      style: boldStyle,
                    ),
                    SizedBox(height: 12),
                    Text(
                      'Ki: ${state.character?.ki ?? 'N/A'}',
                      style: boldStyle,
                    ),
                    SizedBox(height: 12),
                  ],
                );
            }
          },
        ),
      ),
    );
  }
}
