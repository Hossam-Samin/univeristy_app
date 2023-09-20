import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import '../../../business_logic/auth/register/register_cubit.dart';
import '../../styles/app_colors.dart';
import '../../widgets/default_text.dart';
import '../../widgets/default_text_form_field.dart';
import '../login/login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final GlobalKey<FormState> registerKey = GlobalKey<FormState>();

  List<DropdownMenuItem<String>> genderMenu = const [
    DropdownMenuItem(
      value: 'm',
      child: Text('Male'),
    ),
    DropdownMenuItem(
      value: 'f',
      child: Text('Female'),
    ),
  ];
  String gender = 'm';

  void changeGender(val) {
    gender = val;
  }

  var genderSelected = "Select gender";

  @override
  Widget build(BuildContext context) {
    RegisterCubit registerCubit = RegisterCubit.get(context);
    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) {
        return Scaffold(
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: Form(
              key: registerKey,
              child: ListView(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5.h),
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
                      "Register",
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
                        return 'Please Enter Your Name';
                      } else if (value.length > 32) {
                        return 'Name Must be less than 32 characters';
                      }
                    },
                    onChanged: (value) {},
                    hintText: 'Name',
                    isObscureText: false,
                    controller: nameController,
                  ),
                  SizedBox(
                    height: 5.h,
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
                  SizedBox(
                    height: 5.h,
                  ),
                  DefaultTextFormField(
                    validation: (value) {
                      if (value.isEmpty) {
                        return 'Please Enter Your Confirm Password';
                      }
                    },
                    onChanged: (value) {},
                    isPasswordField: true,
                    hintText: 'Confirm Password',
                    controller: confirmPasswordController,
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  DefaultTextFormField(
                    validation: (value) {
                      if (value.isEmpty) {
                        return 'Please Enter Your Phone Number';
                      } else if (value.length != 11) {
                        return "Phone Number Must be 11 Number";
                      }
                    },
                    onChanged: (value) {},
                    hintText: 'Phone Number',
                    isObscureText: false,
                    controller: phoneNumberController,
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      DefaultText(
                        text: 'Gender',
                        fontSize: 15.sp,
                      ),
                      Container(
                        height: 5.h,
                        width: 50.w,
                        padding: EdgeInsets.symmetric(horizontal: 5.w),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.sp),
                            border: Border.all(
                                color: Colors.deepOrange, width: 2.sp)),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            isExpanded: true,
                            onChanged: (value) {
                              registerCubit.changeGender(value);
                            },
                            value: registerCubit.gender,
                            items: genderMenu,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (registerKey.currentState!.validate()) {
                        registerCubit.postRegister(
                            name: nameController.text,
                            email: emailController.text,
                            password: passwordController.text,
                            phoneNumber: phoneNumberController.text,
                            gender: registerCubit.gender == 'male' ? 'm' : 'f');

                        showTopSnackBar(
                          Overlay.of(context),
                          CustomSnackBar.success(
                            borderRadius: BorderRadius.circular(18),
                            backgroundColor: Colors.greenAccent,
                            message: "Register is Successfully",
                          ),
                        );
                      } else {
                        showTopSnackBar(
                          Overlay.of(context),
                          CustomSnackBar.error(
                            borderRadius: BorderRadius.circular(18),
                            backgroundColor: Colors.greenAccent,
                            message: "Invalid Data",
                          ),
                        );
                      }
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        AppColors.primaryColor,
                      ),
                    ),
                    child: const Text('Register'),
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
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginScreen(),
                            ),
                            (route) => false);
                      },
                      style: OutlinedButton.styleFrom(
                        backgroundColor: AppColors.primaryColor,
                        side: const BorderSide(color: AppColors.primaryColor),
                      ),
                      child: const Text('Login')),
                  SizedBox(height: 5.h),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
