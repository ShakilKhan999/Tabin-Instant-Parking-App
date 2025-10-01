import 'package:ahmedkamal443/core/common/styles/global_text_style.dart';
import 'package:ahmedkamal443/core/common/widgets/common_button.dart';
import 'package:ahmedkamal443/core/common/widgets/common_textfield.dart';
import 'package:ahmedkamal443/core/utils/constants/colors.dart';
import 'package:ahmedkamal443/features/authentication/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController controller = Get.find<AuthController>();
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
                    SizedBox(height: 100.h),
                    Text(
                      'Register Your Account',
                      textAlign: TextAlign.center,
                      style: getTextStyle(
                        fontSize: 25.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    SizedBox(height: 50.h),
                    _buildRegisterForm(),
                    SizedBox(height: 30.h),
                    CommonButton(
                      text: 'Register',
                      onPressed: controller.register,
                    ),
                    SizedBox(height: 40.h),
                    _buildSocialLogin(),
                    SizedBox(height: 40.h),
                    _buildLoginRedirect(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRegisterForm() {
    final controller = Get.find<AuthController>();
    return Column(
      children: [
        CommonTextField(
          borderColor: AppColors.primary,
          controller: controller.fullNameController,
          hintText: 'Full Name',
          prefixIcon: Padding(
            padding: EdgeInsets.all(14.0.sp),
            child: Image.asset(
              'assets/icons/User Icon.png',
              width: 20.w,
              height: 20.h,
            ),
          ),
        ),
        SizedBox(height: 20.h),
        CommonTextField(
          borderColor: AppColors.primary,
          controller: controller.regEmailController,
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
            borderColor: AppColors.primary,
            controller: controller.regPasswordController,
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
          'Sign up with',
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

  Widget _buildLoginRedirect() {
    final controller = Get.find<AuthController>();
    return GestureDetector(
      onTap: controller.navigateToLogin,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Already have an Account? ",
            style: getTextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.textSecondary,
            ),
          ),
          Text(
            ' Sign in',
            style: getTextStyle(
              fontSize: 16.sp,
              color: AppColors.text3E41FF,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
