import 'package:api_call_using_cleanarq_di_bloc/core/failures.dart';
import 'package:api_call_using_cleanarq_di_bloc/core/use_cases.dart';
import 'package:api_call_using_cleanarq_di_bloc/domain/entities/character_entity.dart';
import 'package:api_call_using_cleanarq_di_bloc/domain/repositories/characters_repository_contract.dart';
import 'package:dart_either/dart_either.dart';

class GetCharactersUseCase implements NoInputUseCase<List<CharacterEntity>> {
  final CharactersRepositoryContract _charactersRepositoryContract;

  const GetCharactersUseCase(this._charactersRepositoryContract);

  @override
  Future<Either<Failure, List<CharacterEntity>>> run() async {
    return await _charactersRepositoryContract.getCharacters();
  }
}
