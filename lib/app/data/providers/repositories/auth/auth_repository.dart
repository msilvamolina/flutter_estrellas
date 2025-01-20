import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_estrellas/app/data/models/phone/phone_model.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';

class AuthRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

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

  Future<Either<String, Unit>> sendPasswordResetEmail({
    required String email,
  }) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(
        email: email,
      );
      return right(unit);
    } on FirebaseAuthException catch (e) {
      return left(e.code);
    }
  }

  Future<Either<String, Unit>> signInWithFacebook() async {
    try {
      // Inicializa el plugin de Facebook
      final fb = FacebookLogin();

      // Inicia el proceso de inicio de sesión
      final result = await fb.logIn(
        permissions: [
          FacebookPermission.publicProfile,
          FacebookPermission.email,
        ],
      );

      switch (result.status) {
        case FacebookLoginStatus.success:
          // Si el inicio de sesión es exitoso, obtenemos el token de acceso
          final FacebookAccessToken? accessToken = result.accessToken;

          if (accessToken != null) {
            // Creamos una credencial de Firebase con el token de Facebook
            final facebookAuthCredential = FacebookAuthProvider.credential(
              accessToken.token,
            );

            // Inicia sesión en Firebase con la credencial
            await _firebaseAuth.signInWithCredential(facebookAuthCredential);

            return right(unit);
          } else {
            return left("Error desconocido: token de acceso nulo.");
          }

        case FacebookLoginStatus.cancel:
          // El usuario canceló el inicio de sesión
          return left("Inicio de sesión cancelado por el usuario.");

        case FacebookLoginStatus.error:
          // Hubo un error en el proceso de inicio de sesión
          return left(
              "Error en el inicio de sesión de Facebook: ${result.error}");

        default:
          return left("Estado desconocido en Facebook Login.");
      }
    } on FirebaseAuthException catch (e) {
      // Maneja errores de Firebase
      return left(e.code);
    } catch (e) {
      // Maneja cualquier otro error
      return left(e.toString());
    }
  }

  Future<Either<String, Unit>> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      await _firebaseAuth.signInWithCredential(credential);
      return right(unit);
    } on FirebaseAuthException catch (e) {
      return left(e.code);
    }
  }

  Future<Either<String, Unit>> signInWithApple() async {
    try {
      final credential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );

      final oAuthCredential = OAuthProvider("apple.com").credential(
        idToken: credential.identityToken,
        accessToken: credential.authorizationCode,
      );

      await _firebaseAuth.signInWithCredential(oAuthCredential);
      return right(unit);
    } on FirebaseAuthException catch (e) {
      return left(e.code);
    }
  }

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

  Future<Either<String, Unit>> verifyPhoneNumber({
    required String verificationId,
    required String smsCode,
  }) async {
    try {
      final cred = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: smsCode);

      final currentUser = _firebaseAuth.currentUser;

      if (currentUser != null) {
        await currentUser.linkWithCredential(cred);
        return right(unit);
      } else {
        return left('No hay un usuario con la sesión abierta');
      }
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

  User? getCurrentUser() {
    return _firebaseAuth.currentUser;
  }

  Stream<bool> emailVerificationListener() async* {
    final user = _firebaseAuth.currentUser;

    if (user == null) {
      yield false;
      return;
    }

    while (!user.emailVerified) {
      await Future.delayed(const Duration(seconds: 3));
      await user.reload();
      yield user.emailVerified;
    }
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
