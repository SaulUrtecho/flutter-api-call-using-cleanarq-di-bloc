import 'package:api_call_using_cleanarq_di_bloc/data/datasources/characters_remote_data_source.dart';
import 'package:api_call_using_cleanarq_di_bloc/domain/entities/character_entity.dart';
import 'package:api_call_using_cleanarq_di_bloc/core/failures.dart';
import 'package:api_call_using_cleanarq_di_bloc/domain/repositories/characters_repository_contract.dart';
import 'package:dart_either/dart_either.dart';

class CharactersRepositoryImpl implements CharactersRepositoryContract {
  final CharactersRemoteDataSource charactersRemoteDataSource;

  const CharactersRepositoryImpl(this.charactersRemoteDataSource);

  @override
  Future<Either<Failure, List<CharacterEntity>>> getCharacters() {
    return charactersRemoteDataSource.getCharacters();
  }

  @override
  Future<Either<Failure, CharacterEntity>> getCharacterDetailsById(int id) {
    return charactersRemoteDataSource.getCharacterDetailsById(id);
  }
}
