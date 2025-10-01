import 'package:ahmedkamal443/core/common/styles/global_text_style.dart';
import 'package:ahmedkamal443/core/common/widgets/common_button.dart';
import 'package:ahmedkamal443/core/common/widgets/common_textfield.dart';
import 'package:ahmedkamal443/core/utils/constants/colors.dart';
import 'package:ahmedkamal443/features/authentication/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController controller = Get.put(AuthController());
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/auth_bg.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    100.verticalSpace,
                    Text(
                      'Login',
                      style: getTextStyle(
                        fontSize: 25.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    30.verticalSpace,
                    _buildWelcomeTextView(),
                    50.verticalSpace,
                    _buildLoginForm(),
                    20.verticalSpace,
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'Forgot Password?',
                        style: getTextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.text323142,
                        ),
                      ),
                    ),
                    30.verticalSpace,
                    CommonButton(text: 'Login', onPressed: controller.login),
                    40.verticalSpace,
                    _buildSocialLogin(),
                    40.verticalSpace,
                    _buildSignupRedirect(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWelcomeTextView() {
    return RichText(
      text: TextSpan(
        style: getTextStyle(fontSize: 25.sp, color: AppColors.text161616),
        children: [
          const TextSpan(text: 'Welcome to '),
          TextSpan(
            text: 'TaBin',
            style: getTextStyle(
              fontSize: 25.sp,
              color: AppColors.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoginForm() {
    final controller = Get.find<AuthController>();
    return Column(
      children: [
        CommonTextField(
          borderColor: AppColors.border7B7DFF,
          controller: controller.emailController,
          hintText: 'Enter Your Email',
          prefixIcon: Padding(
            padding: EdgeInsets.all(14.0.sp),
            child: Image.asset(
              'assets/icons/Email Icon.png',
              width: 20.w,
              height: 20.h,
            ),
          ),
        ),
        SizedBox(height: 20.h),
        Obx(
          () => CommonTextField(
            borderColor: AppColors.border7B7DFF,
            borderRadius: 13.67.r,
            controller: controller.passwordController,
            hintText: 'Password',
            obscureText: !controller.isPasswordVisible.value,
            prefixIcon: Padding(
              padding: EdgeInsets.all(14.0.sp),
              child: Image.asset(
                'assets/icons/Lock Icon.png',
                width: 20.w,
                height: 20.h,
              ),
            ),
            suffixIcon: IconButton(
              icon: Icon(
                controller.isPasswordVisible.value
                    ? Icons.visibility_outlined
                    : Icons.visibility_off_outlined,
              ),
              onPressed: controller.togglePasswordVisibility,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSocialLogin() {
    return Column(
      children: [
        Text(
          'Login with',
          style: getTextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.textSecondary,
          ),
        ),
        SizedBox(height: 20.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(10.sp),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withValues(alpha: 0.2),
                    spreadRadius: 2,
                    blurRadius: 5,
                  ),
                ],
              ),
              child: Image.asset(
                'assets/icons/google.png',
                width: 25.w,
                height: 25.h,
              ),
            ),
            SizedBox(width: 20.w),
            Container(
              padding: EdgeInsets.all(10.sp),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withValues(alpha: 0.2),
                    spreadRadius: 2,
                    blurRadius: 5,
                  ),
                ],
              ),
              child: Image.asset(
                'assets/icons/facbook.png',
                width: 25.w,
                height: 25.h,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSignupRedirect() {
    final controller = Get.find<AuthController>();
    return GestureDetector(
      onTap: controller.navigateToRegister,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Create New Account? ",
            style: getTextStyle(fontSize: 16.sp, color: AppColors.text161616),
          ),
          Text(
            ' Sign up',
            style: getTextStyle(
              fontSize: 14.sp,
              color: AppColors.text3E41FF,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
