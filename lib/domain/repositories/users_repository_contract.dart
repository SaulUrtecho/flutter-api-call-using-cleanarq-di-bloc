import 'package:bloc_demo/core/failures.dart';
import 'package:bloc_demo/domain/entities/user_entity.dart';
import 'package:either_dart/either.dart';

abstract class UsersRepositoryContract {
  Future<Either<Failure, List<UserEntity>>> getUsers();
}
