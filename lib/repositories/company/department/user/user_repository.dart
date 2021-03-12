import 'package:avatende/models/user_model.dart';
import 'package:avatende/models/views/user_view_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserRepository {
  var _auth = FirebaseAuth.instance;
  var _instance = FirebaseFirestore.instance;
  var _collection;

  Future<String> signUpUser({UserModel usermodel, String password}) async {
    if (_auth.currentUser.email != 'empresa@empresa.com') {
      _collection = 'Users';
    } else {
      _collection = 'UsersDev';
      usermodel.userType += '-Dev';
    }

    if (_auth.currentUser.email != 'jodaias2013@gmail.com') {
      _collection = 'UsersMaster';
    }

    try {
      //Criando user no authentication
      var result = await _auth.createUserWithEmailAndPassword(
          email: usermodel.email, password: password);

      //logica para salvar no banco firestore
      await _instance.collection(_collection).doc(result.user.uid).set({
        'Name': usermodel.name,
        'Phone': usermodel.phone,
        'Active': usermodel.active,
        'Email': usermodel.email,
        'userType': usermodel.userType,
        'DepartmentId': usermodel.departmentId,
      });

      return 'Usuário criado com sucesso!';
    } catch (e) {
      print('Error: $e');
      return 'Erro: Falha ao criar usuário!';
    }
  }

  Future<UserViewModel> signIn({String email, String password}) async {
    try {
      //Logica de enviar os dados no banco e retornar o usuario logado.
      var result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      return await getUserbyId(result.user.uid);
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

  Future<UserViewModel> getUserbyId(String userId) async {
    print(userId);
    if (_auth.currentUser.email != 'empresa@empresa.com') {
      _collection = 'Users';
    } else {
      _collection = 'UsersDev';
    }

    if (_auth.currentUser.email == 'jodaias2013@gmail.com') {
      _collection = 'UsersMaster';
    }

    var user = await _instance.collection(_collection).doc(userId).get();
    print('user atual: $user');
    return UserViewModel(
      name: user.data()["Name"],
      email: user.data()["Email"],
      active: user.data()["Active"],
      departmentId: user.data()["DepartmentId"],
      phone: user.data()["Phone"],
      userId: userId,
      userType: user.data()["UserType"],
    );
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
