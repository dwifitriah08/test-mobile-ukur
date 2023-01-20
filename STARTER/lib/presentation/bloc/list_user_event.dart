part of 'bloc.dart';

abstract class ListUserEvent extends Equatable {
  const ListUserEvent();

  @override
  List<Object> get props => [];
}

class GetUserList extends ListUserEvent {

  
}