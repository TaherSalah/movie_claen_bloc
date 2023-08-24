import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_db/core/utiles/validator.dart';
import 'package:movie_db/movies/presentation/screens/login_screen.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Center(child: RegisterWidget())),
    );
  }
}

class RegisterWidget extends StatelessWidget {
  final formKey = GlobalKey<FormState>();

  RegisterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController userNameController = TextEditingController();
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
            const Text('Register Now'),
            SizedBox(
              height: 50.h,
            ),
            Container(
              padding: EdgeInsets.all(12.5),
              child: defualtFormField(
                controller: userNameController,
                type: TextInputType.text,
                prefix: Icons.email_outlined,
                hintText: 'User Name',
                padding: 0.0,
                validate: Validator.email,
              ),
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
                const Text('already you have an account?'),
                defaultTextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ));
                    },
                    text: 'Login Now'),
              ],
            ),
            SizedBox(
              width: 150,
              child: defaultButton(
                  context: context, onPressed: () {
                    if(formKey.currentState!.validate()){}
              }, text: 'Register'),
            )
          ],
        ),
      ),
    );
  }
}
