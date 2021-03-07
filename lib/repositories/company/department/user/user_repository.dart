import 'package:avatende/models/user_model.dart';
import 'package:avatende/models/views/user_view_model.dart';

class UserRepository {
  Future<UserViewModel> signUpUser(
      {UserModel usermodel, String password}) async {
    await Future.delayed(Duration(seconds: 2));

    //logica para salvar no banco
    try {
      //Tenta cadastrar o usuario

      return UserViewModel();
    } catch (e) {
      print('Error: $e');
      return UserViewModel();
    }
  }

  Future<UserViewModel> signIn({UserModel usermodel, String password}) async {
    await Future.delayed(Duration(seconds: 2));

    //Logica de enviar os dados no banco e retornar o usuario logado.

    try {
      return UserViewModel();
    } catch (e) {
      print('Error: $e');
      return UserViewModel();
    }
  }

  Future<List<UserViewModel>> usersList() async {
    await Future.delayed(Duration(seconds: 2));
    List<UserViewModel> users = [];

    try {
      //logica de trazer os usuarios e salvar na lista users

      return users;
    } catch (e) {
      print('Error: $e');
    }
    return users;
  }

  // Future<List<RelatoryViewModel>> relatorysList() async {
  //   await Future.delayed(Duration(seconds: 2));
  //   List<RelatoryViewModel> relatorys = [];

  //   //logica de trazer os relatorios e salvar na lista relatorys
  //   try {} catch (e) {
  //     print('Error: $e');
  //   }
  //   return relatorys;
  // }
}
