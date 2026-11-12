import 'package:bloc/bloc.dart';
import 'package:bookia_app/features/profile/data/models/profile_response_model.dart';
import 'package:bookia_app/features/profile/repo/profile_repo.dart';
import 'package:flutter/foundation.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  Future<void> getProfileData() async {
    emit(GetProfileLoading());

    try {
      final response = await ProfileRepo.getProfileData();

      if (isClosed) return;

      if (response != null) {
        emit(GetProfileSucsess(response));
      } else {
        emit(GetProfileError());
      }
    } catch (e, stackTrace) {
      debugPrint('PROFILE CUBIT ERROR: $e');
      debugPrintStack(stackTrace: stackTrace);

      if (!isClosed) {
        emit(GetProfileError());
      }
    }
  }
}
