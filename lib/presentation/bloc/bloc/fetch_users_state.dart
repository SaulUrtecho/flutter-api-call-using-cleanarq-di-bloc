part of 'fetch_users_bloc.dart';

class FetchUsersState extends Equatable {
  final AppStatus appStatus;
  final List<UserEntity> users;
  const FetchUsersState({required this.appStatus, required this.users});

  @override
  List<Object?> get props => [appStatus, users];

  FetchUsersState copyWith({AppStatus? appStatus, List<UserEntity>? users}) {
    return FetchUsersState(
      appStatus: appStatus ?? this.appStatus,
      users: users ?? this.users,
    );
  }

  factory FetchUsersState.initial() {
    return const FetchUsersState(appStatus: AppStatus.loading, users: []);
  }
}

enum AppStatus {
  loading,
  completed,
  failure,
}
