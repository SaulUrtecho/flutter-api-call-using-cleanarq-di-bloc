import 'package:bloc_demo/data/datasources/users_remote_data_source.dart';
import 'package:bloc_demo/data/repositories/users_repository_impl.dart';
import 'package:bloc_demo/domain/repositories/users_repository_contract.dart';
import 'package:bloc_demo/domain/use_cases/get_users_use_case.dart';
import 'package:bloc_demo/presentation/bloc/bloc/fetch_users_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' show Client;

final getIt = GetIt.instance;

Future<void> setupDependencies() async {
  // external services
  getIt.registerLazySingleton<Client>(() => Client());

  // datasources
  getIt.registerLazySingleton<UsersRemoteDataSource>(() => UsersRemoteDataSourceImpl(getIt<Client>()));

  // repositories
  getIt.registerLazySingleton<UsersRepositoryContract>(() => UsersRepositoryImpl(getIt<UsersRemoteDataSource>()));

  // use cases
  getIt.registerFactory<GetUsersUseCase>(() => GetUsersUseCase(getIt<UsersRepositoryContract>()));

  // blocs
  getIt.registerFactory<FetchUsersBloc>(() => FetchUsersBloc(getIt<GetUsersUseCase>()));
}
