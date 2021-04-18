part of 'login_bloc.dart';

@immutable
abstract class LoginState extends Equatable {
  const LoginState();
}

@immutable
class InitialState extends LoginState {
  const InitialState();

  @override
  List<Object> get props => [];
}

@immutable
class ContentState extends LoginState {
  const ContentState(this.content);

  final LoginScreenContent content;

  @override
  List<Object> get props => [content];
}