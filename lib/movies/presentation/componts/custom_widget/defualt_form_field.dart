
import 'package:flutter/material.dart';

///////////  Start  defualt Form Field Widget /////////////
Widget defualtFormField({
  String? Function(String?)? validate,
  required TextEditingController controller,
  required TextInputType type,
  required String hintText,
  required IconData prefix,
  Widget? suffix,
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
          suffixIcon:suffix,
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