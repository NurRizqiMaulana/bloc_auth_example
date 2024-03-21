import 'package:bloc/bloc.dart';
import 'package:bloc_auth_sample/auth_bloc/bloc/auth_event.dart';
import 'package:bloc_auth_sample/auth_bloc/bloc/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<LoginEvent>(
      (event, emit) async {
        emit(AuthLoading());
        await Future.delayed(const Duration(seconds: 5));
        emit(AuthSuccess(name: 'Rizqi'));
      },
    );

    on<LogoutEvent>(
      (event, emit) async {
        emit(AuthLoading());
        await Future.delayed(const Duration(seconds: 5));
        emit(AuthInitial());
      },
    );
  }
}
