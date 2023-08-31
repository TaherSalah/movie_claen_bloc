import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_db/core/utiles/validator.dart';
import 'package:movie_db/movies/presentation/componts/custom_widget/defualt_form_field.dart';
import 'package:movie_db/movies/presentation/componts/custom_widget/loading_screen.dart';
import 'package:movie_db/movies/presentation/controller/auth_controller/login_controller.dart';
import 'package:movie_db/movies/presentation/screens/register_screen.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Center(child: LoginWidget())),
    );
  }
}

class LoginWidget extends StatefulWidget {

  LoginWidget({super.key});

  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends StateMVC<LoginWidget> {
  _LoginWidgetState():super(LoginController()){
    con=LoginController();
  }
  late LoginController con;
  @override
  Widget build(BuildContext context) {

    return LoadingScreen(
      loading: con.isLoading,
      child: SingleChildScrollView(
        child: Form(
          key: con.formKey,
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
                  controller: con.emailController,
                  type: TextInputType.emailAddress,
                  prefix: Icons.email_outlined,
                  hintText: 'Email Address',
                  padding: 0.0,
                  validate: Validator.email,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(12.5),
                child: defualtFormField(

                  isPassword: con.isActive,

                  controller: con.passwordController,
                  suffix: InkWell(
                    onTap: con.togglePassword,
                    child: con.isActive
                        ? const Icon(Icons.visibility_off)
                        : const Icon(Icons.visibility),
                  ) ,

                  type: TextInputType.number,
                  prefix: Icons.lock_open_outlined,
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
                    onPressed: () async {
                      if (con.formKey.currentState!.validate()) {
                        await con.login(context,
                            email: con.emailController.text,
                            password: con.passwordController.text);
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
                      await con.signInWithGoogle(context);
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
                   await con.signInAnonymously(context);
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
      ),
    );
  }
}




