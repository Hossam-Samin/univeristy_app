import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import '../../../business_logic/auth/login/login_cubit.dart';
import '../../../constants/constant_methods.dart';
import '../../styles/app_colors.dart';
import '../../widgets/default_text.dart';
import '../../widgets/default_text_form_field.dart';
import '../app_layout/app_layout.dart';
import '../register/register_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> loginKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccessState) {
          showTopSnackBar(
            Overlay.of(context),
            CustomSnackBar.success(
              borderRadius: BorderRadius.circular(18),
              backgroundColor: Colors.greenAccent,
              message: "Logged is Successfully",
            ),
          );
          // flutterToast(msg: 'Logged is Successfully', color: Colors.green);
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const AppLayout(),
              ),
              (route) => false);
        } else {
          showTopSnackBar(
            Overlay.of(context),
            CustomSnackBar.error(
              borderRadius: BorderRadius.circular(18),
              backgroundColor: Colors.redAccent,
              message: "Logged is Invalid",
            ),
          );
        }
      },
      builder: (context, state) {
        LoginCubit loginCubit = LoginCubit.get(context);
        return Scaffold(
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: Form(
              key: loginKey,
              child: ListView(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'Orange',
                          style: TextStyle(
                            color: Colors.deepOrange,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Digital Center',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5.h),
                    child: Text(
                      "Login",
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.sp,
                      ),
                    ),
                  ),
                  DefaultTextFormField(
                    validation: (value) {
                      if (value.isEmpty) {
                        return 'Please Enter Your Email';
                      } else if (!RegExp(
                              "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9+_.-]+.[com]")
                          .hasMatch(value)) {
                        return 'Please Enter Valid as example@gmail.com';
                      }
                    },
                    onChanged: (value) {},
                    hintText: 'Email',
                    isObscureText: false,
                    controller: emailController,
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  DefaultTextFormField(
                    validation: (value) {
                      if (value.isEmpty) {
                        return 'Please Enter Your Password';
                      }
                    },
                    onChanged: (value) {},
                    isPasswordField: true,
                    hintText: 'Password',
                    controller: passwordController,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 3.h),
                    child: Text(
                      "Forget Password?",
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 10.sp,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (loginKey.currentState!.validate()) {
                        loginCubit.postLogin(
                          email: emailController.text,
                          password: passwordController.text,
                        );
                      }
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        AppColors.primaryColor,
                      ),
                    ),
                    child: const Text('Login'),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 2.h),
                    child: Row(
                      children: [
                        const Expanded(
                            child: Divider(
                          color: Colors.grey,
                        )),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 1.w),
                          child: const DefaultText(
                              text: 'OR', textColor: Colors.grey),
                        ),
                        const Expanded(
                            child: Divider(
                          color: Colors.grey,
                        )),
                      ],
                    ),
                  ),
                  OutlinedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const RegisterScreen(),
                            ));
                      },
                      style: OutlinedButton.styleFrom(
                        backgroundColor: AppColors.primaryColor,
                        side: const BorderSide(color: AppColors.primaryColor),
                      ),
                      child: const Text('Register')),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
