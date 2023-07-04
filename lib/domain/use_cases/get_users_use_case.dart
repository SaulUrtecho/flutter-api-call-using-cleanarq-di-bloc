import 'package:bloc_demo/core/failures.dart';
import 'package:bloc_demo/core/use_cases.dart';
import 'package:bloc_demo/domain/entities/user_entity.dart';
import 'package:bloc_demo/domain/repositories/users_repository_contract.dart';
import 'package:either_dart/either.dart';

class GetUsersUseCase implements NoInputUseCase<List<UserEntity>> {
  final UsersRepositoryContract _usersRepositoryContract;

  GetUsersUseCase(this._usersRepositoryContract);

  @override
  Future<Either<Failure, List<UserEntity>>> run() async {
    return await _usersRepositoryContract.getUsers();
  }
}
