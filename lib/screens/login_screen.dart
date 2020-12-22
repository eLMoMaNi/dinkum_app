import 'package:dinkum_app/screens/dashboard_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:flutter_login/flutter_login.dart';

import '../services/auth_service.dart';

enum _Action { SignIn, SignUp }

class LoginScreen extends StatelessWidget {
  final AuthService _authService = AuthService();

  Future<String> _auth(LoginData data, _Action action) async {
    try {
      if (action == _Action.SignIn) {
        await _authService.signInWithEmailAndPassword(data.name, data.password);
      } else {
        await _authService.registerWithEmailAndPassword(
            data.name, data.password);
      }

      if (_authService.user != null) return null;
      return "Something went wrong...";
    } on FirebaseAuthException catch (err) {
      return (err.message);
    } catch (err) {
      return "Something went wrong...";
    }
  }

  //ahmad.mom.20000@gmail.com

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      title: "Dinkum",
      //logo: "https://via.placeholder.com/150" //TODO make a logo,
      onLogin: (data) => _auth(data, _Action.SignIn),
      onSignup: (data) => _auth(data, _Action.SignUp),
      onSubmitAnimationCompleted: () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => DashboardScreen(),
        ));
      },
      messages: LoginMessages(
          usernameHint: "البريد الالكتروني",
          passwordHint: "كلمة المرور",
          confirmPasswordHint: "تأكيد كلمة المرور",
          loginButton: "تسجيل الدخول",
          signupButton: "حساب جديد",
          forgotPasswordButton: "هل نسيت كلمة المرور؟",
          goBackButton: "العودة",
          recoverPasswordButton: "استعادة كلمة المرور",
          recoverPasswordIntro: "إستعادة كلمة المرور",
          recoverPasswordDescription:
              "سنقوم بارسال رابط استعادة كلمة المرور إلى بريدك الإلكتروني",
          //
          confirmPasswordError: "كلمة المرور غير متطابقة",
          recoverPasswordSuccess:
              "تم إرسال رابط تعين كلمة المرور إلى بريدك الإلتكروني"),
    );
  }
}
