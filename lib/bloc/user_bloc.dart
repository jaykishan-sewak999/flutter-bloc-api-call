import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:git_block_demo/bloc/user_event.dart';
import 'package:git_block_demo/bloc/user_state.dart';

import '../api/api_repository.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final APIRepository apiRepository;

  UserBloc({
    required this.apiRepository
}) : super(UserInitial()) {
    on<FetchUsers>((event, emit) async {
      emit(UserLoading());
      try {
        final userList = await apiRepository.fetchUsers();
        emit(UserLoaded(userList));
      } catch (e) {
        print(e);
      }

    });
  }
}
