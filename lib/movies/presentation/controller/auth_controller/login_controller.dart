import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:movie_db/movies/presentation/screens/main_screen.dart';
import 'package:movie_db/movies/presentation/screens/splash_screen.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class LoginController extends ControllerMVC {
  factory LoginController() {
    _this ??= LoginController._();
    return _this!;
  }

  bool isLoading = false;
  bool isActive = true;
  final formKey = GlobalKey<FormState>();
  final userCredential = FirebaseAuth.instance;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  static LoginController? _this;

  LoginController._();

  login(BuildContext context,
      {required String email, required String password}) async {
    try {
      setState(() {
        isLoading = true;
      });
  final user=await  FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);



      setState(() {
        isLoading = false;
      });
        // ignore: use_build_context_synchronously

      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => MainHome(),
          ));
      // ignore: use_build_context_synchronously
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Welcom back !"),
            content:  Text("${user.user?.email}"),
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("Okay"))
            ],
          );
        },
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        isLoading = false;
      });
      if (e.code == 'user-not-found') {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text("Auth Error"),
              content: const Text("No user found for that email"),
              actions: <Widget>[
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text("Okay"))
              ],
            );
          },
        );
        // ignore: avoid_print
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text("Auth error"),
              content: const Text("Wrong password provided for that user."),
              actions: <Widget>[
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text("Okay"))
              ],
            );
          },
        );
        // ignore: avoid_print
        print('Wrong password provided for that user.');
      }
    }
  }

  signInAnonymously(BuildContext context) async {
    try {
      setState(() {
        isLoading = true;
      });

      // ignore: use_build_context_synchronously
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Dialog title"),
            content: const Text("Signed in with temporary account."),
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("Okay"))
            ],
          );
        },
      );
      // ignore: avoid_print
      print("Signed in with temporary account.");
      setState(() {
        isLoading = false;
      });
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => MainHome(),
          ));
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "operation-not-allowed":
          // ignore: avoid_print
          print("Anonymous auth hasn't been enabled for this project.");
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text("Dialog title"),
                content: const Text(
                    "Anonymous auth hasn't been enabled for this project."),
                actions: <Widget>[
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text("Okay"))
                ],
              );
            },
          );
          break;
        default:
          // ignore: avoid_print
          print("Unknown error.");
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text("Dialog title"),
                content: const Text("Unknown error."),
                actions: <Widget>[
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text("Okay"))
                ],
              );
            },
          );
      }
    }
  }



  Future<UserCredential> signInWithGoogle(BuildContext context) async {
    // Trigger the authentication flow
setState(() {
  isLoading=true;
});
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
    await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
setState(() {
  isLoading=false;
});
    // ignore: use_build_context_synchronously
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const MainHome(),
        ));

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }





  void togglePassword() {
    isActive = !isActive;
    setState(() {});
  }

}



