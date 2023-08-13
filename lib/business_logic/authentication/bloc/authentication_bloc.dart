import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:bloc_tutorial/data/models/user_model.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(const AuthenticationState.unknown()) {
    on<checkIfUserSaved>(_checkIfUserExist);
    on<AuthenticationStatusChanged>(_onAuthenticationStatusChanged);
    on<AuthenticationLogoutRequested>(_onAuthenticationLogoutRequested);
  }

  Future<void> _checkIfUserExist(
    checkIfUserSaved event,
    Emitter<AuthenticationState> emit,
  ) async {
    try {
      var prefs = await SharedPreferences
          .getInstance(); //etrieves a value from the SharedPreferences instance using the key 'SavedUserKey'
      var user = prefs.get('SavedUserKey');
      print('The user is $user');
      if (user != null) {
        emit(AuthenticationState.authenticated(userFromJson(user.toString())));
      } else {
        emit(AuthenticationState.unauthenticated());
      }
    } catch (e) {
      print('called $e');
      emit(AuthenticationState.unauthenticated());
    }
  }

  Future<void> _onAuthenticationStatusChanged(
    AuthenticationStatusChanged event,
    Emitter<AuthenticationState> emit,
  ) async {
    var prefs = await SharedPreferences.getInstance();
    switch (event.status) {
      case AuthenticationStatus.unauthenticated:
        prefs.remove('SavedUserKey');
        return emit(AuthenticationState.unauthenticated());
      case AuthenticationStatus.authenticated:
        final userJson = json.encode(event.user.toJson());
        prefs.setString('SavedUserKey', userJson);
        return emit(AuthenticationState.authenticated(event.user));
      case AuthenticationStatus.unknown:
        return emit(AuthenticationState.unknown());
    }
  }

  void _onAuthenticationLogoutRequested(
    AuthenticationLogoutRequested event,
    Emitter<AuthenticationState> emit,
  ) async {
    try {
      var prefs = await SharedPreferences.getInstance();
      prefs.remove("SavedUserKey");
    } catch (e) {
      emit(AuthenticationState.unauthenticated());
    }
  }
}
