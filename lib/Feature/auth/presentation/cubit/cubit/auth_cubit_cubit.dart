// Feature/auth/presentation/cubit/cubit/auth_cubit_cubit.dart

import 'package:bloc/bloc.dart';
import 'package:bookstore/Feature/auth/data/repo/auth_repo.dart';
import 'package:flutter/material.dart';

part 'auth_cubit_state.dart';

class AuthCubitCubit extends Cubit<AuthCubitState> {
  AuthCubitCubit() : super(AuthCubitInitial());

  final AuthRepo authRepo = AuthRepo();

  Future<void> login({required String email, required String password}) async {
    emit(LoginLoadingState());

    final response = await authRepo.login(email: email, password: password);

    if (response) {
      emit(LoginSuccessState());
    } else {
      emit(LoginErroState());
    }
  }
}
