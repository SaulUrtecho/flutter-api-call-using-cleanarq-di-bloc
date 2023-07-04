part of 'fetch_users_bloc.dart';

abstract class FetchUsersEvent extends Equatable {
  const FetchUsersEvent();

  @override
  List<Object> get props => [];
}

class LoadUsers extends FetchUsersEvent {
  const LoadUsers();

  @override
  String toString() => 'LoadUsers';
}
