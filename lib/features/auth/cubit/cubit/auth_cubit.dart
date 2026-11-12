import 'package:bloc/bloc.dart';
import 'package:bookia_app/features/auth/repo/auth_repo.dart';

import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepo authRepo;

  AuthCubit(this.authRepo) : super(AuthInitial());

  Future<void> register({
    required String email,
    required String password,
    required String passwordConfirmation,
    required String name,
  }) async {
    emit(AuthLoading());

    final success = await AuthRepo.register(
      email: email,
      password: password,
      passwordConfirmation: passwordConfirmation,
      name: name,
    );

    if (success) {
      emit(AuthSuccess());
    } else {
      emit(AuthError());
    }
  }

  Future<void> login({required String email, required String password}) async {
    emit(AuthLoading());

    final success = await AuthRepo.login(email: email, password: password);

    if (success) {
      emit(AuthSuccess());
    } else {
      emit(AuthError());
    }
  }
}
