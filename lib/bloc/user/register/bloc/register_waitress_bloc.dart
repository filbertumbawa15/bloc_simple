import 'package:bloc/bloc.dart';
import 'package:denice_ti4mb/params/register_user_params.dart';
import 'package:denice_ti4mb/repo/auth_repository.dart';
import 'package:meta/meta.dart';
import 'package:denice_ti4mb/response/register_user_response.dart';

part 'register_waitress_event.dart';
part 'register_waitress_state.dart';

class RegisterWaitressBloc
    extends Bloc<RegisterWaitressEvent, RegisterWaitressState> {
  RegisterWaitressBloc() : super(RegisterWaitressInitial()) {
    on<CreateWaitressEvent>(_registerWaitress);
  }

  void _registerWaitress(
      CreateWaitressEvent event, Emitter<RegisterWaitressState> emit) async {
    final params = RegisterUserParam(
      event.username,
      event.email,
      event.isActive,
      event.isWaitress,
      event.firstName,
      event.lastName,
      event.password1,
      event.password2,
    );
    emit(RegisterWaitressLoading());
    try {
      RegisterUserResponse response =
          await AuthRepository().registerWaitress(params);
      emit(RegisterWaitressSuccess(registerUserResponse: response));
    } catch (e) {
      emit(RegisterWaitressError(message: e.toString()));
    }
  }
}
