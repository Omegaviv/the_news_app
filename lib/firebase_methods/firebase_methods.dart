import 'package:either_dart/either.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseStoreMethods {
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<Either<CustomError, UserCredential>> signup(String email, String password) async {
    try {
      UserCredential user = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return Right(user);
    } catch (e) {
      return Left(CustomError(message: e.toString()));
    }
  }

  Future<Either<CustomError, UserCredential>> login(String email, String password) async {
    try {
      UserCredential user = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      return Right(user);
    } catch (e) {
      return Left(CustomError(message: e.toString()));
    }
  }

}

//This is a custom error class
class CustomError{
  final String message;
  CustomError({required this.message});

}
