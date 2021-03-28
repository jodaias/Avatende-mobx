import 'package:avatende/models/user_model.dart';
import 'package:avatende/models/views/user_view_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart';

class UserRepository {
  var _auth = FirebaseAuth.instance;
  var _instance = FirebaseFirestore.instance;
  var _collection;

  Future<String> signUpUser({UserModel usermodel, String password}) async {
    if (_auth.currentUser.email == 'empresa@empresa.com') {
      _collection = 'UsersDev';
      usermodel.userType += '-Dev';
    } else {
      _collection = 'Users';
    }

    if (usermodel.userType == 'Master') {
      _collection = 'UsersMaster';
    }

    try {
      //Criando user no authentication
      FirebaseAuth.instance.setPersistence(Persistence.LOCAL);
      var result = await _auth.createUserWithEmailAndPassword(
          email: usermodel.email, password: password);
      var stringKey;
      var stringValue;
      if (usermodel.userType == "Admin" || usermodel.userType == "Admin-Dev") {
        stringKey = 'CompanyId';
        stringValue = usermodel.companyId;
      } else {
        stringKey = 'DepartmentId';
        stringValue = usermodel.departmentId;
      }

      FirebaseAuth.instance.setPersistence(Persistence.LOCAL);
      //logica para salvar no banco firestore
      await _instance.collection(_collection).doc(result.user.uid).set({
        'Name': usermodel.name,
        'Phone': usermodel.phone,
        'Active': usermodel.active,
        'Email': usermodel.email,
        'UserType': usermodel.userType,
        'Address': usermodel.address,
        'CreatedAt': DateTime.now(),
        stringKey: stringValue,
      });

      return 'Usuário criado com sucesso!';
    } catch (e) {
      print('Error: $e');
      return 'Erro: Falha ao criar usuário!';
    }
  }

  Future<UserViewModel> signIn({String email, String password}) async {
    var items = ["UsersDev", "Users", "UsersMaster"];
    var user;

    try {
      //Logica de enviar os dados no banco e retornar o usuario logado.
      var credentialUser = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      for (var item in items) {
        var result =
            await _instance.collection(item).doc(credentialUser.user.uid).get();
        print('userFor ${result.data()}');
        if (result.data() != null) {
          user = result;
        }
      }

      return UserViewModel.fromMap(user);
    } catch (e) {
      print('Error: $e');
      return UserViewModel();
    }
  }

  Future<String> updateUser(
      {String userId, Map<String, dynamic> userData}) async {
    var items = ["UsersDev", "Users", "UsersMaster"];

    try {
      for (var item in items) {
        await _instance.collection(item).doc(userId).update(userData);
      }

      return 'Usuário atualizado com sucesso!';
    } catch (e) {
      print('Error: $e');
      return 'Erro: Falha ao atualizar usuário!';
    }
  }

  Future<void> resetPassword(String email) async {
    await _auth.sendPasswordResetEmail(email: email);
  }

  Future<UserViewModel> getUser({String userId, String userType}) async {
    if (userType == 'Admin-Dev' || userType == 'Atendente-Dev') {
      _collection = 'UsersDev';
    } else if (userType == "Master") {
      _collection = 'UsersMaster';
    } else {
      _collection = 'Users';
    }

    try {
      var user = await _instance.collection(_collection).doc(userId).get();

      return UserViewModel.fromMap(user);
    } catch (e) {
      print('Error: $e');
      return UserViewModel();
    }
  }

  //lista de Users Ativos
  Observable<Stream<List<UserViewModel>>> usersActives(
      String deptOrCompId, String userType) {
    var stringWhere = 'DepartmentId';
    if (userType == 'Admin-Dev' || userType == 'Atendente-Dev') {
      _collection = 'UsersDev';
    } else if (userType == "Master") {
      _collection = 'Users';
      stringWhere = "CompanyId";
    } else {
      _collection = 'Users';
    }

    print('meu $stringWhere repo: $deptOrCompId');

    return Observable(_instance
        .collection(_collection)
        .where(stringWhere, isEqualTo: deptOrCompId)
        .where("Active", isEqualTo: true)
        .snapshots()
        .map((query) => query.docs
            .map<UserViewModel>((document) => UserViewModel.fromMap(document))
            .toList()));
  }

  //lista de Users Inativas
  Observable<Stream<List<UserViewModel>>> usersInactives(
      String deptOrCompId, String userType) {
    var stringWhere = 'DepartmentId';
    if (userType == 'Admin-Dev' || userType == 'Atendente-Dev') {
      _collection = 'UsersDev';
    } else if (userType == "Master") {
      _collection = 'Users';
      stringWhere = "CompanyId";
    } else {
      _collection = 'Users';
    }

    print('meu $stringWhere repo: $deptOrCompId');
    return Observable(_instance
        .collection(_collection)
        .where(stringWhere, isEqualTo: deptOrCompId)
        .where("Active", isEqualTo: false)
        .snapshots()
        .map((query) => query.docs
            .map<UserViewModel>((document) => UserViewModel.fromMap(document))
            .toList()));
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
