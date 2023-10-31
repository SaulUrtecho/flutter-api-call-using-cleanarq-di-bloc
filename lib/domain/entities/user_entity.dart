import 'package:api_call_using_cleanarq_di_bloc/data/models/user_model.dart';
import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final int? id;
  final String? email;
  final String? firstName;
  final String? lastName;
  final String? avatar;

  const UserEntity({this.id, this.email, this.firstName, this.lastName, this.avatar});

  @override
  List<Object?> get props => [id, email, firstName, lastName, avatar];

  factory UserEntity.fromModel(UserModel model) {
    return UserEntity(
      id: model.id,
      email: model.email,
      firstName: model.firstName,
      lastName: model.lastName,
      avatar: model.avatar,
    );
  }
}
