import 'package:appwrite/appwrite.dart';
import 'package:play_right/models/user.dart';

import 'auth_provider.dart';

class AppWriteAuthProvider extends AuthProvider {
  late final Account account;

  static final AppWriteAuthProvider _auth = AppWriteAuthProvider._internal();
  factory AppWriteAuthProvider() {
    _auth.initialize();
    return _auth;
  }
  AppWriteAuthProvider._internal();

  @override
  Future<void> initialize() async {
    /// Does not work if you create a static final variable beforehand
    Client client = Client();
    client
        .setEndpoint('http://159.65.219.151/v1')
        .setProject('playright123')
        .setSelfSigned(status: true);
    account = Account(client);
  }

  @override
  Future<User> createUser(
      {required String userName,
      required String email,
      required String password}) async {
    try {
      await account.create(
          userId: ID.unique(), email: email, password: password);
      final user = await currentUser;
      if (user != null) {
        return user;
      } else {
        throw Exception();
      }
    } on Exception {
      throw Exception();
    }
  }

  @override
  Future<User?> get currentUser async {
    try {
      final result = await account.get();
      return User.fromAppWrite(result.toMap());
    } on Exception {
      return null;
    }
  }

  @override
  Future<User> logIn({required String email, required String password}) async {
    try {
      Future.delayed(const Duration(seconds: 3));
      await account.createEmailSession(email: email, password: password);
      final user = await currentUser;
      if (user != null) {
        return user;
      } else {
        throw Exception();
      }
    } on Exception {
      throw Exception();
    }
  }

  @override
  Future<void> logOut() async {
    await account.deleteSession(
      sessionId: 'current',
    );
  }
}
