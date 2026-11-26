import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

/// Service responsible for Firebase Authentication operations
@LazySingleton()
class FirebaseAuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  Future<UserCredential> createUser({
    required String email,
    required String password,
    required String displayName,
    
  }) async {
    final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    await userCredential.user?.updateDisplayName(displayName);
    await userCredential.user?.reload();
    return userCredential;
  }

  Future<UserCredential> signIn({
    required String email,
    required String pass,
  }) async {
    final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: pass,
    );
    await userCredential.user?.reload();
    return userCredential;
  }

  Future<String> getIdToken({bool forceRefresh = true}) async {
    final user = _firebaseAuth.currentUser;
    if (user == null) {
      throw FirebaseAuthException(
        code: 'no-user',
        message: 'No authenticated user found',
      );
    }

    final idToken = await user.getIdToken(forceRefresh);
    if (idToken == null || idToken.isEmpty) {
      throw FirebaseAuthException(
        code: 'token-error',
        message: 'Failed to get Firebase ID token',
      );
    }
    return idToken;
  }

  Future<void> deleteUser(UserCredential? userCredential) async {
    try {
      if (userCredential?.user != null) {
        await userCredential!.user!.delete();
      }
    } catch (e) {
      log('[log] ⚠️ Failed to delete Firebase user: $e');
    }
  }

  User? get currentUser => _firebaseAuth.currentUser;
}
