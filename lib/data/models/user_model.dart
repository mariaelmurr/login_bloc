import 'dart:convert';

import 'package:equatable/equatable.dart';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User extends Equatable {
  final String username;

  const User(
    this.username,
  );

  @override
  // TODO: implement props
  List<Object?> get props => [username];

  static const empty = User('');

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      json['username'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
        "username": username,
      };
}
