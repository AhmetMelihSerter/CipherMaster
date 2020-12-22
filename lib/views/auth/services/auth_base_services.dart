import 'package:ciphermaster/views/_model/user.dart';

abstract class AuthBaseServices {
  Future<User> signInWithEmailAndPassword(User signInUser);
  Future<User> updateUser(User updatedUser);
  Future<User> createUserWithEmailAndPassword(User createUser);
}
