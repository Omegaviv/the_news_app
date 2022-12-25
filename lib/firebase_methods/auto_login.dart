import 'package:either_dart/either.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'Errors/error.dart';

class auth_and_login{
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<Either<CustomError, UserCredential>> signUp(
      String email, String password) async {
    try {
      UserCredential user = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return Right(user);
    } catch (e) {
      return Left(CustomError(message: e.toString()));
    }
  }

  Future<void> signOut() async {
    await auth.signOut();
  }

  Future<Either<CustomError, UserCredential>> login(
      String email, String password) async {
    try {
      UserCredential user = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      return Right(user);
    } catch (e) {
      return Left(CustomError(message: e.toString()));
    }
  }
}