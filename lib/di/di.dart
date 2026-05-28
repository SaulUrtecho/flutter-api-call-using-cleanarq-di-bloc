import 'package:api_call_using_cleanarq_di_bloc/data/datasources/characters_remote_data_source.dart';
import 'package:api_call_using_cleanarq_di_bloc/data/repositories/characters_repository_impl.dart';
import 'package:api_call_using_cleanarq_di_bloc/domain/repositories/characters_repository_contract.dart';
import 'package:api_call_using_cleanarq_di_bloc/domain/use_cases/get_characters_use_case.dart';
import 'package:api_call_using_cleanarq_di_bloc/presentation/bloc/bloc/fetch_characters_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' show Client;

final getIt = GetIt.instance;

Future<void> setupDependencies() async {
  // external services
  getIt.registerLazySingleton<Client>(() => Client());

  // datasources
  getIt.registerLazySingleton<CharactersRemoteDataSource>(
    () => CharactersRemoteDataSourceImpl(getIt<Client>()),
  );

  // repositories
  getIt.registerLazySingleton<CharactersRepositoryContract>(
    () => CharactersRepositoryImpl(getIt<CharactersRemoteDataSource>()),
  );

  // use cases
  getIt.registerFactory<GetCharactersUseCase>(
    () => GetCharactersUseCase(getIt<CharactersRepositoryContract>()),
  );

  // blocs
  getIt.registerFactory<FetchCharactersBloc>(
    () => FetchCharactersBloc(getIt<GetCharactersUseCase>()),
  );
}
