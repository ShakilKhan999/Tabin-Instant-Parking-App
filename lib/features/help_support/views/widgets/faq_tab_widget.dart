import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../core/utils/constants/app_colors.dart';
import '../../../../core/utils/constants/app_constants.dart';
import '../../../../core/utils/constants/app_text_styles.dart';
import '../../controllers/help_support_controller.dart';

/// FAQ Tab Widget
/// Displays frequently asked questions with expand/collapse functionality
class FaqTabWidget extends StatelessWidget {
  /// FAQ Tab Widget constructor
  const FaqTabWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HelpSupportController controller = Get.find<HelpSupportController>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section title
        Text(
          'Frequently Asked Questions',
          style: AppTextStyles.headlineSmall.copyWith(
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),

        SizedBox(height: AppConstants.spacing16),

        // FAQ list
        Obx(() => _buildFaqList(controller)),
      ],
    );
  }

  /// Builds the FAQ list with filtered results
  Widget _buildFaqList(HelpSupportController controller) {
    final faqs = controller.filteredFaqs;

    if (faqs.isEmpty) {
      return _buildEmptyState();
    }

    return Column(
      children: faqs.asMap().entries.map((entry) {
        final index = entry.key;
        final faq = entry.value;
        return Column(
          children: [
            _buildFaqItem(
              index: index,
              question: faq['question'] ?? '',
              answer: faq['answer'] ?? '',
              controller: controller,
            ),
            SizedBox(height: AppConstants.spacing15),
          ],
        );
      }).toList(),
    );
  }

  /// Builds individual FAQ item
  Widget _buildFaqItem({
    required int index,
    required String question,
    required String answer,
    required HelpSupportController controller,
  }) {
    return Obx(() {
      final isExpanded = controller.isFaqExpanded(index);

      return GestureDetector(
        onTap: () => controller.toggleFaqExpansion(index),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(isExpanded ? 20.r : 15.r),
            border: Border.all(
              color: isExpanded
                  ? AppColors.primary
                  : const Color(0xFFCBD3FF).withValues(alpha: 0.4),
              width: 1,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Question header
              Row(
                children: [
                  Expanded(
                    child: Text(
                      question,
                      style: AppTextStyles.labelMedium.copyWith(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ),

                  SizedBox(width: AppConstants.spacing8),

                  // Expand/collapse icon
                  AnimatedRotation(
                    turns: isExpanded ? 0.5 : 0.0, // 0.5 turns = 180 degrees
                    duration: const Duration(milliseconds: 300),
                    child: Icon(
                      Icons.keyboard_arrow_down,
                      size: 24.w,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ],
              ),

              // Answer content (shown when expanded with animation)
              AnimatedCrossFade(
                firstChild: const SizedBox.shrink(),
                secondChild: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: AppConstants.spacing12),
                    Text(
                      answer,
                      style: AppTextStyles.bodyMedium.copyWith(
                        fontSize: 14.sp,
                        color: const Color(0xFF7F7F7F),
                        height: 1.4,
                      ),
                    ),
                  ],
                ),
                crossFadeState: isExpanded
                    ? CrossFadeState.showSecond
                    : CrossFadeState.showFirst,
                duration: const Duration(milliseconds: 300),
              ),
            ],
          ),
        ),
      );
    });
  }

  /// Builds empty state when no FAQs match search
  Widget _buildEmptyState() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(32.w),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(
          color: const Color(0xFFCBD3FF).withValues(alpha: 0.4),
          width: 1,
        ),
      ),
      child: Column(
        children: [
          Icon(Icons.search_off, size: 48.w, color: const Color(0xFF9C9C9C)),

          SizedBox(height: AppConstants.spacing16),

          Text(
            'No FAQs Found',
            style: AppTextStyles.titleMedium.copyWith(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),

          SizedBox(height: AppConstants.spacing8),

          Text(
            'Try searching with different keywords or browse all FAQs',
            style: AppTextStyles.bodyMedium.copyWith(
              fontSize: 14.sp,
              color: const Color(0xFF7F7F7F),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
