import 'package:api_call_using_cleanarq_di_bloc/data/datasources/users_remote_data_source.dart';
import 'package:api_call_using_cleanarq_di_bloc/domain/entities/user_entity.dart';
import 'package:api_call_using_cleanarq_di_bloc/core/failures.dart';
import 'package:api_call_using_cleanarq_di_bloc/domain/repositories/users_repository_contract.dart';
import 'package:either_dart/either.dart';

class UsersRepositoryImpl implements UsersRepositoryContract {
  final UsersRemoteDataSource usersRemoteDataSource;

  UsersRepositoryImpl(this.usersRemoteDataSource);

  @override
  Future<Either<Failure, List<UserEntity>>> getUsers() {
    return usersRemoteDataSource.getUsers();
  }
}
