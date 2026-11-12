part of 'profile_cubit.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class GetProfileLoading extends ProfileState {}

final class GetProfileSucsess extends ProfileState {
  final ProfileData? profileData;
  GetProfileSucsess(this.profileData);
}

final class GetProfileError extends ProfileState {}
