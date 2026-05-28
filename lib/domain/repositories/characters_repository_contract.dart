import 'package:api_call_using_cleanarq_di_bloc/core/failures.dart';
import 'package:api_call_using_cleanarq_di_bloc/domain/entities/character_entity.dart';
import 'package:dart_either/dart_either.dart';

abstract class CharactersRepositoryContract {
  Future<Either<Failure, List<CharacterEntity>>> getCharacters();
  Future<Either<Failure, CharacterEntity>> getCharacterDetailsById(int id);
}
