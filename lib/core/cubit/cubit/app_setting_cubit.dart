import 'package:bloc/bloc.dart';
import 'package:denice_ti4mb/core/session_manager.dart';
import 'package:meta/meta.dart';

part 'app_setting_state.dart';

class AppSettingCubit extends Cubit<AppSettingState> {
  final sessionManager = SessionManager();
  AppSettingCubit() : super(AppSettingLoading()) {
    checkSession();
  }

  void checkSession() {
    final activeSession = sessionManager.anyActiveSession();
    if (activeSession) {
      emit(AppSettingAuthenticated());
    } else {
      emit(AppSettingUnAuthenticated());
    }
  }
}
