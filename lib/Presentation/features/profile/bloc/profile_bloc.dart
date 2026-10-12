import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobility/Domain/Entity/user.dart';
import 'package:mobility/Domain/UseCase/get_user_usecase.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  GetUserUseCase getUserUseCase;
  ProfileBloc({required this.getUserUseCase}) : super(ProfileInitial()) {
    on<ProfileMainEvent>(_loaded);
  }

  Future<void> _loaded(
    ProfileMainEvent event,
    Emitter<ProfileState> emit,
  ) async {
    emit(ProfileLoading());

    try {
      final user = await getUserUseCase.execute();
      emit(ProfileLoaded(user: user));
    } catch (err) {
      emit(ProfileFailure(message: err.toString()));
    }
  }
}
