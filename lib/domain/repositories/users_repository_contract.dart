import 'package:api_call_using_cleanarq_di_bloc/core/failures.dart';
import 'package:api_call_using_cleanarq_di_bloc/domain/entities/user_entity.dart';
import 'package:dart_either/dart_either.dart';

abstract class UsersRepositoryContract {
  Future<Either<Failure, List<UserEntity>>> getUsers();
}
