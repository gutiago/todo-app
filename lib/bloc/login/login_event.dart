part of 'login_bloc.dart';

@immutable
abstract class LoginEvent extends Equatable {
  Stream<LoginState> applyAsync(LoginBloc bloc);

  @override
  List<Object> get props => [];
}

@immutable
class FillScreenContentEvent extends LoginEvent {
  FillScreenContentEvent();

  @override
  Stream<LoginState> applyAsync(LoginBloc bloc) async* {
    yield ContentState(LoginDefaultEmpty.empty);
  }
}
