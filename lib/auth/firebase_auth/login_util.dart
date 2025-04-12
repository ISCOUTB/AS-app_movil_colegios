import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '/auth/firebase_auth/firebase_user_provider.dart'; // AppMcolegiosFirebaseUser
import '/flutter_flow/nav/nav.dart'; // AppStateNotifier + prepareAuthEvent

Future<void> login(String email, String password, BuildContext context) async {
  final mounted = context.mounted; // 👈 guarda el estado aquí

  try {
    final userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);

    print('✅ Login exitoso');

    if (!mounted) return;

    GoRouter.of(context).prepareAuthEvent();

    final authUser =
        AppMcolegiosFirebaseUser.fromUserCredential(userCredential);
    AppStateNotifier.instance.update(authUser);

    print('🧠 Usuario logueado en AppState: ${AppStateNotifier.instance.loggedIn}');

    if (context.mounted) {
      context.go('/home');
    }
  } on FirebaseAuthException catch (e) {
    print('❌ Error de FirebaseAuth: $e');

    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Correo o contraseña incorrectos.'),
          backgroundColor: Colors.red,
        ),
      );
    }
  } catch (e) {
    print('❌ Error inesperado en login: $e');
  }
}
