// Feature/auth/presentation/cubit/cubit/auth_cubit_state.dart
part of 'auth_cubit_cubit.dart';

@immutable
sealed class AuthCubitState {}

final class AuthCubitInitial extends AuthCubitState {}

final class LoginLoadingState extends AuthCubitState {}

final class LoginSuccessState extends AuthCubitState {}

final class LoginErroState extends AuthCubitState {}
