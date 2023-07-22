import 'package:movie_db_bloc/core/exports/exports_files.dart';



class LoadingScreen extends StatelessWidget {
  final Widget child;
  final bool loading, withDropdown;
  const LoadingScreen({Key? key, required this.child, this.loading = false,  this.withDropdown=false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          child,
          loading
              ? Positioned.fill(
                  child: Container(
                    color: Colors.grey.withOpacity(0.3),
                  ),
                )
              : const SizedBox(),
          loading
              ? Positioned(
                  child:
                  // Container(
                  //     decoration: BoxDecoration(color: ThemeClass.primaryColor),
                  //     child: Image.asset(
                  //       "assets/images/Guidlle.gif",
                  //       height: 150.h,
                  //       width: 250.w,
                  //     )),
                  CircularProgressIndicator(
                      color:withDropdown ==true ?Colors.transparent: ThemeClass.primaryColor, ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
