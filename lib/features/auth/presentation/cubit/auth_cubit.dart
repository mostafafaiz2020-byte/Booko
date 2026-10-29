import 'package:bloc/bloc.dart';
import 'package:bookia/features/auth/data/repo/auth_repo.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  login({required String email, required String password}) async {
    emit(LoginLodinState());
    final Response = await AuthRepo.login(email: email, password: password);
    if (Response) {
      emit(LoginSuccessState());
    } else {
      emit(LoginErrorState());
    }
  }

  register({
    required String username,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    emit(RegisterLodinState());
    final Response = await AuthRepo.login(email: email, password: password);
    if (Response) {
      emit(RegisterSuccessState());
    } else {
      emit(RegisterErrorState());
    }
  }
}
