import 'package:api_call_using_cleanarq_di_bloc/core/failures.dart';
import 'package:api_call_using_cleanarq_di_bloc/core/use_cases.dart';
import 'package:api_call_using_cleanarq_di_bloc/domain/entities/user_entity.dart';
import 'package:api_call_using_cleanarq_di_bloc/domain/repositories/users_repository_contract.dart';
import 'package:either_dart/either.dart';

class GetUsersUseCase implements NoInputUseCase<List<UserEntity>> {
  final UsersRepositoryContract _usersRepositoryContract;

  GetUsersUseCase(this._usersRepositoryContract);

  @override
  Future<Either<Failure, List<UserEntity>>> run() async {
    return await _usersRepositoryContract.getUsers();
  }
}
