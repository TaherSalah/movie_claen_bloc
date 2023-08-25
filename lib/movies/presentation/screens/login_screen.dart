import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:movie_db/core/utiles/validator.dart';
import 'package:movie_db/movies/presentation/screens/main_home.dart';
import 'package:movie_db/movies/presentation/screens/movies_screen.dart';
import 'package:movie_db/movies/presentation/screens/register_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Center(child: LoginWidget())),
    );
  }
}

class LoginWidget extends StatelessWidget {
  final formKey = GlobalKey<FormState>();

  LoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final userCredential = FirebaseAuth.instance;
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(height: 100, 'assets/images/splashImage.png'),
            SizedBox(
              height: 50.h,
            ),
            Text('Welcom back'),
            SizedBox(
              height: 50.h,
            ),
            Container(
              padding: EdgeInsets.all(12.5),
              child: defualtFormField(
                controller: emailController,
                type: TextInputType.text,
                prefix: Icons.email_outlined,
                hintText: 'Email Address',
                padding: 0.0,
                validate: Validator.email,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(12.5),
              child: defualtFormField(
                controller: passwordController,
                type: TextInputType.text,
                prefix: Icons.email_outlined,
                hintText: 'your password',
                padding: 0.0,
                validate: Validator.password,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Don'/t have an account?"),
                defaultTextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RegisterScreen(),
                          ));
                    },
                    text: 'Register Now'),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 150,
              child: defaultButton(
                  context: context,
                  onPressed: () async{
                    if (formKey.currentState!.validate()) {
                      await login(
                      context,
                      email: emailController.text,
                      password: passwordController.text);
                    }
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => const RegisterScreen(),));
                  },
                  text: 'Login'),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () async {

            await        signInWithGoogle(context);
                  },
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Image.asset('assets/images/google.png'),
                          const Text("Google"),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: () async {
                    try {
                      final userCredential =
                          await FirebaseAuth.instance.signInAnonymously();
                      print("Signed in with temporary account.");
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MoviesScreen(),
                          ));
                    } on FirebaseAuthException catch (e) {
                      switch (e.code) {
                        case "operation-not-allowed":
                          print(
                              "Anonymous auth hasn't been enabled for this project.");

                          break;
                        default:
                          print("Unknown error.");
                      }
                    }
                  },
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Image.asset('assets/images/anonymous.png'),
                          const Text("Anonymous"),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

///////////  Start  defualt Form Field Widget /////////////
Widget defualtFormField({
  String? Function(String?)? validate,
  required TextEditingController controller,
  required TextInputType type,
  required String hintText,
  required IconData prefix,
  IconData? suffix,
  bool isPassword = false,
  VoidCallback? suffixPressed,
  double padding = 15.0,
  double borderRadius = 25.0,
  void Function()? onTap,
  ValueChanged<String>? onChanged,
  String? Function(String?)? onSubmitted,
}) =>
    Container(
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: TextFormField(
        style: const TextStyle(
          fontSize: 15,
          color: Colors.grey,
        ),
        obscureText: isPassword,
        validator: validate,
        onTap: onTap,
        onChanged: onChanged,
        onFieldSubmitted: onSubmitted,
        controller: controller,
        keyboardType: type,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          prefixIcon: Icon(prefix),
          suffixIcon: IconButton(icon: Icon(suffix), onPressed: suffixPressed),
          hintText: hintText,
        ),
      ),
    );
///////////  End  defualt Form Field Widget /////////////
///////////  Start  default Button Widget /////////////
Widget defaultButton(
        {required context,
        formKey,
        required VoidCallback onPressed,
        required String text}) =>
    Center(
      child: Container(
        width: double.infinity,
        height: 50.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0), color: Colors.black),
        child: MaterialButton(
          onPressed: onPressed,
          child: Text(
            text,
            style: Theme.of(context)
                .textTheme
                .headline6
                ?.copyWith(color: Colors.white),
          ),
        ),
      ),
    );
///////////  End  default Button Widget /////////////
///////////  Start  default Text Button Widget /////////////

Widget defaultTextButton(
        {required VoidCallback onPressed, required String text}) =>
    TextButton(onPressed: onPressed, child: Text(text));
///////////  End  default Text Button Widget /////////////

login(BuildContext context,{required String email, required String password}) async {
  try {
    final credential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MainHome(),));
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      print('No user found for that email.');
    } else if (e.code == 'wrong-password') {
      print('Wrong password provided for that user.');
    }
  }
}
  Future<UserCredential> signInWithGoogle(BuildContext context) async {
    // Trigger the authentication flow

    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MainHome(),));

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
