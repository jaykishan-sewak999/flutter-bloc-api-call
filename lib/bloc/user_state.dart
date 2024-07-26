import 'package:equatable/equatable.dart';

import '../model/user.dart';

abstract class UserState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

class UserLoaded extends UserState {
  final List<User> list;

  UserLoaded(this.list);

  @override
  // TODO: implement props
  List<Object?> get props => [list];
}

class UserError extends UserState {
  final String errorMEssage;

  UserError(this.errorMEssage);

  @override
  List<Object?> get props => [errorMEssage];
}
