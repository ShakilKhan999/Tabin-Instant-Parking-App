import 'package:ahmedkamal443/core/common/styles/global_text_style.dart';
import 'package:ahmedkamal443/core/common/widgets/common_button.dart';
import 'package:ahmedkamal443/core/utils/constants/colors.dart';
import 'package:ahmedkamal443/features/onboarding/controller/onboarding_controller.dart';
import 'package:ahmedkamal443/features/onboarding/views/widgets/circular_progress_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatelessWidget {
  final OnboardingController controller = Get.put(OnboardingController());
  final PageController pageController = PageController();

  OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView.builder(
            controller: pageController,
            onPageChanged: controller.updatePage,
            itemCount: controller.onboardingData.length,
            itemBuilder: (context, index) {
              if (index == 0) {
                return _buildWelcomeView(context);
              }
              return _buildOnboardingPage(context, index);
            },
          ),
          Positioned(
            bottom: 30.h,
            left: 24.w,
            right: 24.w,
            child: _buildActionButtons(),
          ),
        ],
      ),
    );
  }

  Widget _buildWelcomeView(BuildContext context) {
    final data = controller.onboardingData[0];
    return Column(
      children: [
        Expanded(
          flex: 2,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(data.image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: 60.h,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.white.withValues(alpha: 0.7),
                        Colors.white,
                      ],
                      stops: const [0.0, 0.5, 1.0],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                _buildContent(0),
                const Spacer(flex: 3),
                // 90.verticalSpace,
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildOnboardingPage(BuildContext context, int index) {
    final data = controller.onboardingData[index];
    return Column(
      children: [
        Expanded(
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(data.image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: 50.h,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.white.withOpacity(0.8),
                        Colors.white,
                      ],
                      stops: const [0.0, 0.5, 1.0],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildPageIndicatorSection(),
                40.verticalSpace,
                _buildContent(index),
                40.verticalSpace,
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildContent(int index) {
    final data = controller.onboardingData[index];
    return Column(
      children: [
        if (index == 0)
          Image.asset(
            'assets/icons/teabin_logo.png',
            width: 170.w,
            height: 140.h,
            fit: BoxFit.cover,
          ),
        // SizedBox(height: index == 0 ? 0.h : 0),
        if (index == 0)
          Text(
            data.title,
            textAlign: TextAlign.center,
            style: getTextStyle(
              fontSize: 34.sp,
              color: AppColors.primary,
              fontWeight: FontWeight.w700,
            ),
          )
        else
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: getTextStyle(
                fontSize: 26.sp,
                color: AppColors.textSecondary,
                fontWeight: FontWeight.w500,
              ),
              children: _buildTitleSpans(data.title),
            ),
          ),
        SizedBox(height: 16.h),
        Text(
          data.subtitle,
          style: getTextStyle(fontSize: 16.sp, color: AppColors.textSecondary),
          textAlign: TextAlign.center,
        ),
        if (data.description != null) ...[
          30.verticalSpace,
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(15.sp),
            margin: EdgeInsets.symmetric(horizontal: 30.w),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.borderColor),
              borderRadius: BorderRadius.circular(15.r),
              color: AppColors.textWhite,
            ),
            child: Text(
              data.description!,
              style: getTextStyle(
                fontSize: 14.sp,
                color: AppColors.primary,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ],
    );
  }

  List<TextSpan> _buildTitleSpans(String title) {
    final spans = <TextSpan>[];
    final words = title.split(' ');

    for (final word in words) {
      if (word == 'TaBin!' ||
          word == 'Instantly' ||
          word == 'Rewards' ||
          word == 'Park') {
        spans.add(
          TextSpan(
            text: '$word ',
            style: getTextStyle(color: Colors.deepPurple, fontSize: 26.sp),
          ),
        );
      } else {
        spans.add(TextSpan(text: '$word '));
      }
    }
    return spans;
  }

  Widget _buildPageIndicatorSection() {
    return Obx(() {
      if (controller.currentPage.value > 0) {
        return SmoothPageIndicator(
          controller: pageController,
          count: controller.onboardingData.length,
          effect: ExpandingDotsEffect(
            dotColor: Colors.grey[300]!,
            activeDotColor: Colors.deepPurple,
            dotHeight: 8.h,
            dotWidth: 8.w,
            spacing: 8.w,
          ),
        );
      }
      return const SizedBox.shrink();
    });
  }

  Widget _buildActionButtons() {
    return Obx(() {
      final currentPage = controller.currentPage.value;
      final isLastPage = currentPage == controller.onboardingData.length - 1;

      if (currentPage == 0) {
        return CommonButton(
          text: controller.onboardingData[currentPage].buttonText,
          onPressed: () {
            pageController.nextPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.ease,
            );
          },
        );
      }

      if (isLastPage) {
        // Last page - only show CircularProgressButton, centered
        return Center(
          child: CircularProgressButton(
            progress: 1.0, // Full progress on last page
            onPressed: () {
              controller.skipOnboarding();
            },
          ),
        );
      }

      // Middle pages - show both Skip and CircularProgressButton
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: controller.skipOnboarding,
            child: Container(
              width: 85.w,
              padding: EdgeInsets.all(15.sp),
              decoration: BoxDecoration(
                color: AppColors.greyE7,
                borderRadius: BorderRadius.circular(30.sp),
              ),
              alignment: Alignment.center,
              child: Text(
                'Skip',
                style: getTextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.text161616,
                ),
              ),
            ),
          ),
          CircularProgressButton(
            progress: (currentPage) / (controller.onboardingData.length - 1),
            onPressed: () {
              pageController.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.ease,
              );
            },
          ),
        ],
      );
    });
  }
}
