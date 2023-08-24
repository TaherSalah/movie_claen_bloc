import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_db/core/utiles/validator.dart';
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
              width: 150,
              child: defaultButton(
                  context: context,
                  onPressed: () {
                    if(formKey.currentState!.validate()){}
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => const RegisterScreen(),));
                  },
                  text: 'Login'),
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
