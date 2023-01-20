part of 'bloc.dart';

abstract class ListUserState extends Equatable {
  const ListUserState();

  @override
  List<Object?> get props => [];
}

class ListUserInitial extends ListUserState {}

class ListUserLoading extends ListUserState {}

class ListUserLoaded extends ListUserState {
  final List<UserResponse> listUserModel;
  const ListUserLoaded(this.listUserModel);
}

class ListUserError extends ListUserState {
  final String? message;
  const ListUserError(this.message);
}