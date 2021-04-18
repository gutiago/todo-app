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

@immutable
class AttemptLoginEvent extends LoginEvent {
  AttemptLoginEvent({
    this.currentState,
    this.email,
    this.password,
    this.onResponse,
  });

  final ContentState currentState;
  final String email;
  final String password;
  final Function(String errorMessage) onResponse;

  @override
  Stream<LoginState> applyAsync(LoginBloc bloc) async* {
    yield ContentState(currentState.content.copyWith(isLoading: true));

    switch (currentState.content.action) {
      case LoginAction.login:
        yield* _performLogin(bloc);
        break;
      case LoginAction.register:
        yield* _performRegistration(bloc);
        break;
    }
  }

  @override
  List<Object> get props => [currentState];

  Stream<LoginState> _performLogin(LoginBloc bloc) async* {
    final message = await bloc._authenticator.login(email, password);
    yield* _streamForResponse(message);
  }

  Stream<LoginState> _performRegistration(LoginBloc bloc) async* {
    final message = await bloc._authenticator.createUser(email, password);
    yield* _streamForResponse(message);
  }

  Stream<LoginState> _streamForResponse(String message) async* {
    if (message != null) {
      yield ContentState(currentState.content.copyWith(isLoading: false));
    }

    onResponse(message);
  }
}
