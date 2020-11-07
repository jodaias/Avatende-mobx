import 'package:avatende/models/user_model.dart';

class Repository {
  Future<void> signUp(UserModel usermodel) async {
    await Future.delayed(Duration(seconds: 2));
  }
}
