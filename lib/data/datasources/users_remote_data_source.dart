import 'dart:convert';
import 'package:api_call_using_cleanarq_di_bloc/core/failures.dart';
import 'package:api_call_using_cleanarq_di_bloc/data/models/user_model.dart';
import 'package:api_call_using_cleanarq_di_bloc/domain/entities/user_entity.dart';
import 'package:either_dart/either.dart';
import 'package:http/http.dart';

abstract class UsersRemoteDataSource {
  Future<Either<Failure, List<UserEntity>>> getUsers();
}

class UsersRemoteDataSourceImpl implements UsersRemoteDataSource {
  final Client client;

  UsersRemoteDataSourceImpl(this.client);

  @override
  Future<Either<Failure, List<UserEntity>>> getUsers() async {
    try {
      final response = await client.get(Uri.parse('https://reqres.in/api/users?page=2'));

      if (response.statusCode == 200) {
        final List result = jsonDecode(response.body)['data'];
        return Right(result.map((i) => UserModel.fromJson(i)).map((i) => UserEntity.fromModel(i)).toList());
      } else {
        return Left(ServerFailure());
      }
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
