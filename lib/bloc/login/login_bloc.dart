import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../auth/firebase_authenticator.dart';
import '../../model/login/login_screen_content.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({
    required FirebaseAuthenticator authenticator,
  })  : _authenticator = authenticator,
        super(const InitialState());

  final FirebaseAuthenticator _authenticator;

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    yield* event.applyAsync(this);
  }
}
