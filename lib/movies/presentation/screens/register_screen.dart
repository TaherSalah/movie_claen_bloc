import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_db/core/shared_pref/shared_preferances.dart';
import 'package:movie_db/core/utiles/validator.dart';
import 'package:movie_db/movies/presentation/screens/login_screen.dart';
import 'package:movie_db/movies/presentation/screens/movies_screen.dart';
TextEditingController userNameController = TextEditingController();
TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();
UserCredential? user;
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
  State<RegisterWidget> createState() => _RegisterWidgetState();
}

class _RegisterWidgetState extends State<RegisterWidget> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

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
                prefix: Icons.person,
                hintText: 'User Name',
                padding: 0.0,
                validate: Validator.name,
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
                    if(formKey.currentState!.validate()){
                     user =  await register(context);

          await    SharedPref.setLogIn(token: user?.user?.uid);
          print(user);

                      // AwesomeDialog(context: context,title: 'alert',body: Text('sign in faild')).show();

                      // userNameController.value=const TextEditingValue();
                      // passwordController.value=const TextEditingValue();
                      // emailController.value=const TextEditingValue();
                    }
                    setState(() {

                    });
              }, text: 'Register'),
            )
          ],
        ),
      ),
    );
  }
}
register(BuildContext context)async{
  try {
    final UserCredential  credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: emailController.text,
      password: passwordController.text,
    );
    return credential;
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      // ignore: use_build_context_synchronously
      AwesomeDialog(context: context,title: 'alert',body: Text('The password provided is too weak.')).show();

      print('The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      // ignore: use_build_context_synchronously
      AwesomeDialog(context: context,title: 'alert',body: Text('The account already exists for that email.')).show();

      print('The account already exists for that email.');
    }
  } catch (e) {
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