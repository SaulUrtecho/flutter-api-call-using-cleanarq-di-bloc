import 'package:api_call_using_cleanarq_di_bloc/data/models/character.dart';
import 'package:equatable/equatable.dart';

class CharacterEntity extends Equatable {
  final int? id;
  final String? name;
  final String? ki;
  final String? maxKi;
  final String? race;
  final String? gender;
  final String? description;
  final String? image;
  final String? affiliation;

  const CharacterEntity({
    this.id,
    this.name,
    this.ki,
    this.maxKi,
    this.race,
    this.gender,
    this.description,
    this.image,
    this.affiliation,
  });

  @override
  List<Object?> get props => [
    id,
    name,
    ki,
    maxKi,
    race,
    gender,
    description,
    image,
    affiliation,
  ];

  factory CharacterEntity.fromModel(Character model) {
    return CharacterEntity(
      id: model.id,
      name: model.name,
      ki: model.ki,
      maxKi: model.race,
      gender: model.gender,
      description: model.description,
      image: model.image,
      affiliation: model.affiliation,
    );
  }
}
