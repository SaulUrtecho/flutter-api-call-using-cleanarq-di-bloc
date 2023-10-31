import 'package:api_call_using_cleanarq_di_bloc/domain/entities/user_entity.dart';
import 'package:api_call_using_cleanarq_di_bloc/domain/use_cases/get_users_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'fetch_users_event.dart';
part 'fetch_users_state.dart';

class FetchUsersBloc extends Bloc<FetchUsersEvent, FetchUsersState> {
  final GetUsersUseCase _getUsersUseCase;

  FetchUsersBloc(this._getUsersUseCase) : super(FetchUsersState.initial()) {
    on<LoadUsers>(_loadUsers);
  }

  Future<void> _loadUsers(LoadUsers event, Emitter<FetchUsersState> emit) async {
    final response = await _getUsersUseCase.run();
    if (response.isRight) {
      emit(state.copyWith(appStatus: AppStatus.completed, users: response.right));
    } else {
      emit(state.copyWith(appStatus: AppStatus.failure));
    }
  }
}
