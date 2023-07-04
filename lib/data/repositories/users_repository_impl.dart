import 'package:bloc_demo/data/datasources/users_remote_data_source.dart';
import 'package:bloc_demo/domain/entities/user_entity.dart';
import 'package:bloc_demo/core/failures.dart';
import 'package:bloc_demo/domain/repositories/users_repository_contract.dart';
import 'package:either_dart/either.dart';

class UsersRepositoryImpl implements UsersRepositoryContract {
  final UsersRemoteDataSource usersRemoteDataSource;

  UsersRepositoryImpl(this.usersRemoteDataSource);

  @override
  Future<Either<Failure, List<UserEntity>>> getUsers() {
    return usersRemoteDataSource.getUsers();
  }
}
