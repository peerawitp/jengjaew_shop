import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:jengjaew_shop/models/user_model.dart';
import 'package:jengjaew_shop/services/database_service.dart';

class AuthService {
  final auth.FirebaseAuth _firebaseAuth = auth.FirebaseAuth.instance;
  final DatabaseService _databaseService;

  AuthService({required DatabaseService dbService})
      : _databaseService = dbService;

  Future<User?> signInWithEmailAndPassword(
      {required email, required password}) async {
    final UserCredential = await auth.FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email!, password: password!);

    final userUid = UserCredential.user!.uid;
    final user = await _databaseService.getUserFromUid(uid: userUid);

    return user;
  }

  Future<void> signOut() async {
    await auth.FirebaseAuth.instance.signOut();
    return;
  }

  Future<User> createUser(
      {required email,
      required username,
      required password,
      role,
      phone,
      address,
      coin}) async {
    final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);

    if (userCredential.user == null) {
      throw Exception('create user failed');
    }

    final firebaseUser = userCredential.user;
    final newUser = User(
        uid: firebaseUser!.uid,
        email: email,
        username: username,
        phone: phone,
        address: address,
        role: 'user',
        coin: 0);
    // TODO add new user to firestore
    _databaseService.createUserFromModel(user: newUser);
    return newUser;
  }
}
