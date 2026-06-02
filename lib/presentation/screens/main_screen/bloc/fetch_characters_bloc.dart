import 'package:api_call_using_cleanarq_di_bloc/core/app_status.dart';
import 'package:api_call_using_cleanarq_di_bloc/domain/entities/character_entity.dart';
import 'package:api_call_using_cleanarq_di_bloc/domain/use_cases/get_characters_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'fetch_characters_event.dart';
part 'fetch_characters_state.dart';

class FetchCharactersBloc
    extends Bloc<FetchCharactersEvent, FetchCharactersState> {
  final GetCharactersUseCase _getCharactersUseCase;

  FetchCharactersBloc(this._getCharactersUseCase)
    : super(FetchCharactersState.initial()) {
    on<LoadCharacters>(_loadCharacters);
  }

  Future<void> _loadCharacters(
    LoadCharacters event,
    Emitter<FetchCharactersState> emit,
  ) async {
    final response = await _getCharactersUseCase.run();

    response.fold(
      ifLeft: (_) => emit(state.copyWith(appStatus: AppStatus.failure)),
      ifRight: (characters) => emit(
        state.copyWith(appStatus: AppStatus.completed, characters: characters),
      ),
    );
  }
}
