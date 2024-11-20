import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_estrellas/app/data/models/phone/phone_model.dart';

class AuthRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  /// Inicia sesión con email y contraseña
  Future<Either<String, Unit>> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return right(unit);
    } on FirebaseAuthException catch (e) {
      return left(e.code);
    }
  }

  /// Crea un usuario con email y contraseña
  Future<Either<String, Unit>> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return right(unit);
    } on FirebaseAuthException catch (e) {
      return left(e.code);
    }
  }

  Future<String?> getUserEmail() async {
    try {
      if (_firebaseAuth.currentUser == null) {
        return null;
      }
      String? email = await _firebaseAuth.currentUser!.email;
      return email;
    } on FirebaseAuthException catch (e) {
      return null;
    }
  }

  Future<void> sendPhoneOTP(PhoneModel phone) async {
    String userPhone = '+${phone.countryCode!}${phone.number}';

    print('send to $userPhone');
  }

  /// Envía un email de verificación
  Future<Either<String, Unit>> sendEmailVerification() async {
    try {
      if (_firebaseAuth.currentUser == null) {
        return left('No user');
      }
      await _firebaseAuth.currentUser!.sendEmailVerification();
      return right(unit);
    } on FirebaseAuthException catch (e) {
      return left(e.code);
    }
  }

  /// Devuelve el usuario actual
  User? getCurrentUser() {
    return _firebaseAuth.currentUser;
  }

  /// Escucha cambios en la verificación del email
  Stream<bool> emailVerificationListener() async* {
    final user = _firebaseAuth.currentUser;

    if (user == null) {
      yield false; // No hay usuario logueado
      return;
    }

    while (!user.emailVerified) {
      await Future.delayed(
          const Duration(seconds: 3)); // Verifica cada 3 segundos
      await user.reload(); // Refresca el estado del usuario
      yield user.emailVerified; // Emite el estado de verificación
    }
  }

  /// Cierra la sesión del usuario
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
