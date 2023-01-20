import 'package:equatable/equatable.dart';
import 'package:fake_json/data/models/models.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/datasources/datasources.dart';

part 'list_user_event.dart';
part 'list_user_state.dart';

class ListUserBloc extends Bloc<ListUserEvent, ListUserState> {
  ListUserBloc() : super(ListUserInitial()) {

    on<GetUserList>((event, emit) async {
      try {
        emit(ListUserLoading());
        final mList = await loadLocalRecipe();
        emit(ListUserLoaded(mList));
        // for(int i=0; i<=mList.length;i++){
        //   if (mList[i].error != null) {
        //   emit(ListUserError(mList[i].error));
        // }
        // }
        
        
      } on NetworkError {
        emit(ListUserError("Failed to fetch data. is your device online?"));
      }
    });
  }
}