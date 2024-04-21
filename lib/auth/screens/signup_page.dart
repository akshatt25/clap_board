import 'package:clap_board/auth/auth_controller.dart';
import 'package:clap_board/utils/colors.dart';
import 'package:clap_board/utils/dimensions.dart';
import 'package:clap_board/widgets/custom_button.dart';
import 'package:clap_board/widgets/custom_text_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupPage extends StatefulWidget {
  static const route = '/signupoptions';
  static launch() => Get.toNamed(route);

  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  bool isChecked = false;
  final _signinFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            width: MediaQuery.sizeOf(context).width,
            padding: EdgeInsets.symmetric(horizontal: Dimensions.height30),
            child: GetBuilder<AuthController>(
              builder: (controller) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: Dimensions.height70 * 2),

                    SizedBox(
                      height: Dimensions.height40,
                    ),
                    Form(
                      key: _signinFormKey,
                      child: Column(
                        children: [
                          // CustomTextField(
                          //   controller: controller.fullNameController,
                          //   hintText: 'Full Name',
                          // ),
                          // SizedBox(
                          //   height: 10.h,
                          // ),
                          CustomTextField(
                            controller: controller.emailController,
                            hintText: 'Email',
                          ),
                          SizedBox(
                            height: Dimensions.height10,
                          ),
                          CustomTextField(
                            hidden: true,
                            controller: controller.passwordController,
                            hintText: 'Password',
                          ),
                          SizedBox(
                            height: Dimensions.height20,
                          ),
                          FormField<bool>(
                            builder: (state) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Checkbox(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(4)),
                                        activeColor: AppColors.blue,
                                        side: const BorderSide(
                                            color: AppColors.blue, width: 2),
                                        checkColor: AppColors.white,
                                        value: isChecked,
                                        onChanged: (value) {
                                          setState(() {
                                            isChecked = value!;
                                            state.didChange(value);
                                          });
                                        },
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.sizeOf(context).width /
                                                1.5,
                                        child: RichText(
                                          text: TextSpan(children: <TextSpan>[
                                            TextSpan(
                                              text:
                                                  'By signing up, you agree to the ',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14.5,
                                              ),
                                            ),
                                            TextSpan(
                                                text: 'Terms of Service',
                                                style: TextStyle(
                                                  color: AppColors.blue,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14.5,
                                                  decoration:
                                                      TextDecoration.underline,
                                                ),
                                                recognizer:
                                                    TapGestureRecognizer()
                                                      ..onTap = () async {}),
                                            TextSpan(
                                              text: '  and  ',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14.5,
                                              ),
                                            ),
                                            TextSpan(
                                                text: 'Privacy Policy',
                                                style: TextStyle(
                                                  color: AppColors.blue,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14.5,
                                                  decoration:
                                                      TextDecoration.underline,
                                                ),
                                                recognizer:
                                                    TapGestureRecognizer()
                                                      ..onTap = () async {}),
                                          ]),
                                        ),
                                      ),
                                    ],
                                  ),
                                  // CheckboxListTile(

                                  //   activeColor: AppColors.,
                                  //   side: const BorderSide(
                                  //       color: AppColors., width: 2),
                                  //   checkColor: AppColors.white,
                                  //   value: isChecked,
                                  //   onChanged: (value) {
                                  //     setState(() {
                                  //       isChecked = value!;
                                  //       state.didChange(value);
                                  //     });
                                  //   },
                                  //   checkboxShape: RoundedRectangleBorder(
                                  //     borderRadius: BorderRadius.circular(5),
                                  //   ),
                                  //   controlAffinity:
                                  //       ListTileControlAffinity.leading,
                                  //   contentPadding: const EdgeInsets.all(0),
                                  //  visualD\
                                  //ensity: const VisualDensity(
                                  //       vertical: -4, horizontal: -4),
                                  //   title:
                                  // ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: Text(
                                      state.errorText ?? '',
                                      style: TextStyle(
                                        fontSize: 13,
                                        color: Theme.of(context).errorColor,
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                            validator: (value) {
                              if (!isChecked) {
                                return 'Accept Terms to Continue';
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: Dimensions.height20,
                          ),
                          Obx(
                            () => CustomButton(
                              onPressed: () async {
                                if (_signinFormKey.currentState!.validate() &&
                                    isChecked) {
                                  controller.signUpWithEmail(
                                      controller.emailController.text,
                                      controller.passwordController.text);
                                }
                              },
                              text: "Sign Up",
                              isLoading: controller.isLoading.value,
                            ),
                          ),
                          SizedBox(
                            height: Dimensions.height20,
                          ),
                          const Text(
                            '-OR-',
                            style: TextStyle(color: Colors.grey),
                          ),
                          SizedBox(
                            height: Dimensions.height10,
                          ),
                        ],
                      ),
                    ),
                    // AuthMethodButton(
                    //     onTap: () => controller.signInWithGoogle(),
                    //     icon: googleIcon,
                    //     text: 'Sign In With Google'),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     IconButton(
                    //       onPressed: () => controller.signInWithGoogle(),
                    //       icon: Container(
                    //         padding: EdgeInsets.all(10),
                    //         decoration: BoxDecoration(
                    //             borderRadius: BorderRadius.circular(10),
                    //             border: Border.all(color: Colors.black54)),
                    //         child: Image.asset(
                    //           googleIcon,
                    //           height: 30.h,
                    //         ),
                    //       ),
                    //     ),
                    //     // SizedBox(width: Dimensions.width10),
                    //     // IconButton(
                    //     //   onPressed: () => controller.signInWithFacebook(),
                    //     //   icon: Container(
                    //     //     padding: EdgeInsets.all(10),
                    //     //     decoration: BoxDecoration(
                    //     //         borderRadius: BorderRadius.circular(10),
                    //     //         border: Border.all(color: Colors.black54)),
                    //     //     child: Image.asset(
                    //     //       facebookIcon,
                    //     //       color: const Color(0xFF3A5BA2),
                    //     //       height: 30.h,
                    //     //     ),
                    //     //   ),
                    //     // ),
                    //     // SizedBox(width: Dimensions.width10),
                    //     // IconButton(
                    //     //   onPressed: () => {},
                    //     //   icon: Container(
                    //     //     padding: const EdgeInsets.all(10),
                    //     //     decoration: BoxDecoration(
                    //     //         borderRadius: BorderRadius.circular(10),
                    //     //         border: Border.all(color: Colors.black54)),
                    //     //     child: Image.asset(
                    //     //       appleIcon,
                    //     //       height: 30.h,
                    //     //     ),
                    //     //   ),
                    //     // ),
                    //   ],
                    // ),
                    SizedBox(height: Dimensions.width20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Already Have An Account ?  ',
                            style:
                                TextStyle(color: Colors.black87, fontSize: 15)),
                        GestureDetector(
                          // onTap: () => LoginOptionsPage.launch(),
                          child: Text('Sign In',
                              style: TextStyle(
                                  color: AppColors.blue, fontSize: 17.5)),
                        )
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
        )));
  }
}
