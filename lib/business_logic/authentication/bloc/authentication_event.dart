part of 'authentication_bloc.dart';

sealed class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class checkIfUserSaved extends AuthenticationEvent {}

class AuthenticationStatusChanged extends AuthenticationEvent {
  const AuthenticationStatusChanged(this.status, this.user);

  final AuthenticationStatus status;
  final User user;

  List<Object> get props => [status, user];
}

class AuthenticationLogoutRequested extends AuthenticationEvent {}
