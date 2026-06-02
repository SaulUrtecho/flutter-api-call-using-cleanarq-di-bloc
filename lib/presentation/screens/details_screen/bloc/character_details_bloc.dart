import 'package:api_call_using_cleanarq_di_bloc/core/app_status.dart';
import 'package:api_call_using_cleanarq_di_bloc/domain/entities/character_entity.dart';
import 'package:api_call_using_cleanarq_di_bloc/domain/use_cases/get_characters_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'character_details_event.dart';
part 'character_details_state.dart';

class CharacterDetailsBloc
    extends Bloc<CharacterDetailsEvent, CharacterDetailsState> {
  final GetCharacterByIdUseCase _getCharacterByIdUseCase;

  CharacterDetailsBloc(this._getCharacterByIdUseCase)
    : super(CharacterDetailsState.initial()) {
    on<LoadCharactersDetails>(_loadCharactersDetails);
  }

  Future<void> _loadCharactersDetails(
    LoadCharactersDetails event,
    Emitter<CharacterDetailsState> emit,
  ) async {
    final response = await _getCharacterByIdUseCase.run(event.id);

    response.fold(
      ifLeft: (_) => emit(state.copyWith(appStatus: AppStatus.failure)),
      ifRight: (character) => emit(
        state.copyWith(appStatus: AppStatus.completed, character: character),
      ),
    );
  }
}
