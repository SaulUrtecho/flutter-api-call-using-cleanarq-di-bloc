import 'dart:convert';
import 'package:api_call_using_cleanarq_di_bloc/core/failures.dart';
import 'package:api_call_using_cleanarq_di_bloc/data/models/character.dart';
import 'package:api_call_using_cleanarq_di_bloc/domain/entities/character_entity.dart';
import 'package:dart_either/dart_either.dart';

import 'package:http/http.dart';

abstract class CharactersRemoteDataSource {
  Future<Either<Failure, List<CharacterEntity>>> getCharacters();
}

class CharactersRemoteDataSourceImpl implements CharactersRemoteDataSource {
  final Client client;

  const CharactersRemoteDataSourceImpl(this.client);

  @override
  Future<Either<Failure, List<CharacterEntity>>> getCharacters() async {
    try {
      final response = await client.get(
        Uri.parse('https://dragonball-api.com/api/characters'),
      );

      if (response.statusCode == 200) {
        final List result = jsonDecode(response.body)['items'];
        return Right(
          result
              .map((i) => Character.fromJson(i))
              .map((i) => CharacterEntity.fromModel(i))
              .toList(),
        );
      } else {
        return Left(ServerFailure());
      }
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
