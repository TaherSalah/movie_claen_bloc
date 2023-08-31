import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_db/core/shared_pref/shared_preferances.dart';
import 'package:movie_db/core/utiles/validator.dart';
import 'package:movie_db/movies/presentation/componts/custom_widget/defualt_form_field.dart';
import 'package:movie_db/movies/presentation/componts/custom_widget/loading_screen.dart';
import 'package:movie_db/movies/presentation/controller/auth_controller/register_controller.dart';
import 'package:movie_db/movies/presentation/screens/login_screen.dart';
import 'package:movie_db/movies/presentation/screens/movies_screen.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Center(child: RegisterWidget())),
    );
  }
}

class RegisterWidget extends StatefulWidget {

  RegisterWidget({super.key});

  @override
  _RegisterWidgetState createState() => _RegisterWidgetState();
}

class _RegisterWidgetState extends StateMVC<RegisterWidget> {
  _RegisterWidgetState():super(RegisterController()){
    con= RegisterController() ;

  }

  late RegisterController con;



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
              const Text('Register Now'),
              SizedBox(
                height: 50.h,
              ),
              Container(
                padding: EdgeInsets.all(12.5),
                child: defualtFormField(
                  controller: con.userNameController,
                  type: TextInputType.text,
                  prefix: Icons.person,
                  hintText: 'User Name',
                  padding: 0.0,
                  validate: Validator.name,
                ),
              ),
              Container(
                padding: EdgeInsets.all(12.5),
                child: defualtFormField(
                  controller: con.emailController,
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
                  controller: con.passwordController,
                  type: TextInputType.text,
                  prefix: Icons.lock,
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

                    context: context, onPressed: () async {
                      if(con.formKey.currentState!.validate()){
                        con.user =  await register(context, email: con.emailController.text, password: con.passwordController.text);


                      }

                }, text: 'Register'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
register(BuildContext context,
    {required String email, required String password}) async {
  try {
    // setState(() {
    //   isLoading = true;
    // });
    final UserCredential credential =
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    // setState(() {
    //   isLoading = false;
    // });
    // ignore: use_build_context_synchronously
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => MainHome(),
        ));
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Welcom"),
          content:  Text("${credential.user?.email}"),
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
    return credential;
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      // ignore: use_build_context_synchronously, avoid_print
      print('The password provided is too weak.');
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Dialog title"),
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
    } else if (e.code == 'email-already-in-use') {
      // ignore: use_build_context_synchronously

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Dialog title"),
            content: const Text("email-already-in-use"),
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

      showDialog(
        context: context,
        builder: (BuildContext context) {
          // setState(() {
          //   isLoading = false;
          // });
          return AlertDialog(
            title: const Text("Dialog title"),
            content: const Text("The account already exists for that email."),
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
      print('The account already exists for that email.');
    }
  } catch (e) {
    // ignore: avoid_print
    print(e);
  }
}
var token = SharedPref.getLogIn();
initShard()async{
  if(token != null){
    print('tokkkkkkkken is $token');
  }else{
    print('no tolkkkkkkkkken');
  }
}