import 'package:bloc_tutorial/data/models/user_model.dart';

class AuthenticationRepository {
  Future<User?> loginByEmailService(
      {required String username, required String password}) async {
    try {
      if ((username == 'test1' || username == 'test2') && password == 'test') {
        return User(username);
      } else {
        throw Exception('Wrong credentials');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
