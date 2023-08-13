part of 'login_bloc.dart';

final class LoginState extends Equatable {
  const LoginState({
    this.status = FormzSubmissionStatus.initial,
    this.username = const Username.pure(),
    this.password = const Password.pure(),
    this.isValid = false,
    this.errorMessage = "",
    this.user = User.empty,
  });

  final FormzSubmissionStatus status;
  final Username username;
  final Password password;
  final bool isValid;
  final String errorMessage;
  final User user;

  LoginState copyWith({
    FormzSubmissionStatus? status,
    Username? username,
    Password? password,
    bool? isValid,
    String? errorMessage,
    User? user,
  }) {
    return LoginState(
      status: status ?? this.status,
      username: username ?? this.username,
      password: password ?? this.password,
      isValid: isValid ?? this.isValid,
      errorMessage: errorMessage ?? this.errorMessage,
      user: user ?? this.user,
    );
  }

  @override
  List<Object> get props => [status, username, password, errorMessage, user];
}
