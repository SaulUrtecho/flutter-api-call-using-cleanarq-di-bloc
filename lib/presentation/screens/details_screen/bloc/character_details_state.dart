part of 'character_details_bloc.dart';

class CharacterDetailsState extends Equatable {
  final AppStatus appStatus;
  final CharacterEntity? character;

  const CharacterDetailsState({
    required this.appStatus,
    required this.character,
  });

  @override
  List<Object> get props => [appStatus, ?character];

  CharacterDetailsState copyWith({
    AppStatus? appStatus,
    CharacterEntity? character,
  }) => CharacterDetailsState(
    appStatus: appStatus ?? this.appStatus,
    character: character ?? this.character,
  );

  factory CharacterDetailsState.initial() =>
      CharacterDetailsState(appStatus: AppStatus.loading, character: null);
}
