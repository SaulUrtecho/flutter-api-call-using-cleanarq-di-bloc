part of 'character_details_bloc.dart';

sealed class CharacterDetailsEvent extends Equatable {
  const CharacterDetailsEvent();

  @override
  List<Object> get props => [];
}

class LoadCharactersDetails extends CharacterDetailsEvent {
  final int id;

  const LoadCharactersDetails(this.id);

  @override
  List<Object> get props => [id];
}
