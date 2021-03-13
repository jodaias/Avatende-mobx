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

    if (usermodel.userType == '1') {
      _collection = 'UsersMaster';
    }

    try {
      //Criando user no authentication
      FirebaseAuth.instance.setPersistence(Persistence.LOCAL);
      var result = await _auth.createUserWithEmailAndPassword(
          email: usermodel.email, password: password);
      var stringKey;
      var stringValue;
      if (usermodel.userType == "2") {
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
    var listColections = ["Users", "UsersDev", "UsersMaster"];

    try {
      var user;

      for (var collection in listColections) {
        //Logica de enviar os dados no banco e retornar o usuario logado.
        var result = await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        user =
            await _instance.collection(collection).doc(result.user.uid).get();
      }

      return UserViewModel.fromMap(user);
    } catch (e) {
      print('Error: $e');
      return UserViewModel();
    }
  }

  Future<String> activeUser(String userId) async {
    if (_auth.currentUser.email == 'empresa@empresa.com') {
      _collection = 'UsersDev';
    } else {
      _collection = 'Users';
    }
    try {
      FirebaseAuth.instance.setPersistence(Persistence.LOCAL);
      await _instance
          .collection(_collection)
          .doc(userId)
          .update({'Active': true});

      return 'Usuário criado com sucesso!';
    } catch (e) {
      print('Error: $e');
      return 'Erro: Falha ao criar usuário!';
    }
  }

  //lista de Departamentos Ativas
  Observable<Stream<List<UserViewModel>>> usersActives(String deptOrCompId) {
    var stringWhere = '';
    if (_auth.currentUser.email == 'empresa@empresa.com') {
      _collection = 'UsersDev';
    } else {
      _collection = 'Users';
    }
    stringWhere = "DepartmentId";
    if (_auth.currentUser.email == "jodaias2013@gmail.com") {
      stringWhere = "CompanyId";
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

  //lista de Departamentos Inativas
  Observable<Stream<List<UserViewModel>>> usersInactives(String deptOrCompId) {
    var stringWhere = '';
    if (_auth.currentUser.email == 'empresa@empresa.com') {
      _collection = 'UsersDev';
    } else {
      _collection = 'Users';
    }
    stringWhere = "DepartmentId";
    if (_auth.currentUser.email == "jodaias2013@gmail.com") {
      stringWhere = "CompanyId";
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
