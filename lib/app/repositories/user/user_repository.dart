import 'package:avatende/app/enums/user-type.dart';
import 'package:avatende/app/models/user_model.dart';
import 'package:avatende/app/models/views/user_view_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mobx/mobx.dart';

class UserRepository {
  var _auth = FirebaseAuth.instance;

  var _instance = FirebaseFirestore.instance;
  var _collection = "Users";

  Future<String> signUpUser(
      {required UserModel usermodel, required String password}) async {
    var authSecond = await _getSecondInstanceAuth();

    try {
      //Criando user no authentication
      var user = await _createNewAccount(
          email: usermodel.email, password: password, authSecond: authSecond);

      if (user == null) return 'Erro: Falha ao criar usuário!';

      var stringKey;
      var stringValue;
      if (usermodel.userType == UserType.Admin) {
        stringKey = 'CompanyId';
        stringValue = usermodel.companyId;
      } else {
        stringKey = 'DepartmentId';
        stringValue = usermodel.departmentId;
      }

      var image = usermodel.image != null ? usermodel.image : "";

      //logica para salvar no banco firestore
      await _instance.collection(_collection).doc(user.uid).set({
        'Name': usermodel.name,
        'Active': usermodel.active,
        'Email': usermodel.email,
        'UserType': usermodel.userType.index,
        'Image': image,
        'CreatedAt': DateTime.now(),
        'UserId': user.uid,
        stringKey: stringValue,
      });

      authSecond.signOut();

      return 'Usuário criado com sucesso!';
    } catch (e) {
      authSecond.currentUser!.delete();
      authSecond.signOut();
      print('Error: $e');
      return 'Erro: Falha ao criar usuário!';
    }
  }

  Future<bool> deleteuserInDatabase(String uid) async {
    try {
      await _instance.collection(_collection).doc(uid).delete();
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<User?> _createNewAccount(
      {required String email,
      required String password,
      required FirebaseAuth authSecond}) async {
    var result = await authSecond.createUserWithEmailAndPassword(
        email: email, password: password);

    if (result.user == null) return null;

    return result.user;
  }

  Future<FirebaseAuth> _getSecondInstanceAuth() async {
    FirebaseApp app;
    var appExist = Firebase.apps.length > 1;

    if (appExist) {
      app = Firebase.apps.where((element) => element.name == "Secondary").first;
    } else {
      app = await Firebase.initializeApp(
          name: 'Secondary', options: Firebase.app().options);
    }

    return FirebaseAuth.instanceFor(app: app);
  }

  Future<UserViewModel> signIn(
      {required String email, required String password}) async {
    try {
      //Logica de enviar os dados no banco e retornar o usuario logado.
      var credentialUser = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      var user = await _instance
          .collection("Users")
          .doc(credentialUser.user?.uid)
          .get();
      final userId = <String, dynamic>{"": user.id};
      user.data()!.addEntries(userId.entries);
      return UserViewModel.fromMap(user.data()!);
    } catch (e) {
      print('Error: $e');
      return UserViewModel();
    }
  }

  Future<bool> updateUser(
      {required String userId, required Map<String, dynamic> userData}) async {
    try {
      _collection = 'Users';

      await _instance.collection(_collection).doc(userId).update(userData);

      return true;
    } catch (e) {
      print('Error: $e');
      return false;
    }
  }

  Future<void> resetPassword(String email) async {
    await _auth.sendPasswordResetEmail(email: email);
  }

  Future<UserViewModel> getUser(
      {required String userId, UserType? userType}) async {
    try {
      var user = await _instance.collection(_collection).doc(userId).get();
      user.data()!.addEntries({"Id": userId}.entries);
      return UserViewModel.fromMap(user.data()!);
    } catch (e) {
      print('Error: $e');
      return UserViewModel();
    }
  }

  Future<List<UserViewModel>> filterUsersByDepartment(
      String departmentId, bool userActive) async {
    //filtra todos os usuarios ativos ou inativos pelo departamento escolhido;
    _collection = "Users";

    var snapshot = await _instance
        .collection(_collection)
        .where("DepartmentId", isEqualTo: departmentId)
        .where("Active", isEqualTo: userActive)
        .get();

    var users = snapshot.docs.map((doc) {
      final userId = <String, dynamic>{"": doc.id};
      doc.data().addEntries(userId.entries);
      return UserViewModel.fromMap(doc.data());
    }).toList();
    return users;
  }

  //lista de Users
  Observable<Stream<List<UserViewModel>>> users(String deptOrCompId,
      UserType userType, bool usersActive, bool orderByAz) {
    var stringWhere = 'DepartmentId';
    _collection = 'Users';

    if (userType == UserType.Master) {
      stringWhere = "CompanyId";
    }

    print('meu $stringWhere repo: $deptOrCompId');

    return Observable(_instance
        .collection(_collection)
        .where(stringWhere, isEqualTo: deptOrCompId)
        .where("Active", isEqualTo: usersActive)
        .orderBy('Name', descending: !orderByAz)
        .snapshots()
        .map((query) => query.docs.map<UserViewModel>((document) {
              final userId = <String, dynamic>{"": document.id};
              document.data().addEntries(userId.entries);
              return UserViewModel.fromMap(document.data());
            }).toList()));
  }
}
