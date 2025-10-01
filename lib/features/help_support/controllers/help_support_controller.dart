import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Help & Support Controller
/// Manages state for FAQ and Contact Us functionality
class HelpSupportController extends GetxController {
  // Tab selection (0 = FAQ, 1 = Contact Us)
  final RxInt selectedTab = 0.obs;

  // Search functionality
  final TextEditingController searchController = TextEditingController();
  final RxString searchQuery = ''.obs;

  // FAQ expansion states - only one can be expanded at a time
  final RxInt expandedFaqIndex = (-1).obs; // -1 means no FAQ is expanded

  // Feedback form
  final TextEditingController feedbackController = TextEditingController();

  // FAQ data
  final List<Map<String, String>> faqData = [
    {
      'question': 'How to Report a Parking Spot',
      'answer':
          'Users earn real money; limited-time visibility; app takes small commission',
    },
    {
      'question': 'Managing Your Wallet',
      'answer':
          'Learn how to manage your wallet, check balance, and withdraw earnings from your parking reports.',
    },
    {
      'question': 'Notification Settings',
      'answer':
          'Customize your notification preferences to stay updated on parking spot alerts and earnings.',
    },
    {
      'question': 'Earning Points & Tips',
      'answer':
          'Discover various ways to earn points and tips for reporting parking spots and helping other users.',
    },
    {
      'question': 'Referral Program',
      'answer':
          'Invite friends and earn bonuses through our referral program. Both you and your friends get rewards.',
    },
  ];

  /// Gets filtered FAQ list based on search query
  List<Map<String, String>> get filteredFaqs {
    if (searchQuery.value.isEmpty) {
      return faqData;
    }

    return faqData.where((faq) {
      final question = faq['question']?.toLowerCase() ?? '';
      final answer = faq['answer']?.toLowerCase() ?? '';
      final query = searchQuery.value.toLowerCase();

      return question.contains(query) || answer.contains(query);
    }).toList();
  }

  /// Toggles FAQ expansion state (accordion behavior - only one can be open)
  void toggleFaqExpansion(int index) {
    if (expandedFaqIndex.value == index) {
      // If clicking on already expanded FAQ, close it
      expandedFaqIndex.value = -1;
    } else {
      // Open the clicked FAQ and close others
      expandedFaqIndex.value = index;
    }
  }

  /// Checks if FAQ is expanded
  bool isFaqExpanded(int index) {
    return expandedFaqIndex.value == index;
  }

  /// Handles feedback submission
  void submitFeedback() {
    if (feedbackController.text.isEmpty) {
      Get.snackbar(
        'Error',
        'Please enter your feedback',
        backgroundColor: const Color(0xFFFF383C),
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    // Simulate feedback submission
    Get.snackbar(
      'Success',
      'Your feedback has been submitted successfully!',
      backgroundColor: const Color(0xFF8EDB2D),
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
    );

    feedbackController.clear();
  }

  /// Handles phone call action
  void makePhoneCall() {
    // In a real app, this would open the phone dialer
    Get.snackbar(
      'Info',
      'Opening phone dialer: +1 800 123 4567',
      backgroundColor: const Color(0xFF7E6DFB),
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  /// Handles email action
  void sendEmail() {
    // In a real app, this would open the email client
    Get.snackbar(
      'Info',
      'Opening email client: support@tabin.app',
      backgroundColor: const Color(0xFF7E6DFB),
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  /// Handles support ticket submission
  void submitSupportTicket() {
    // Navigate to support ticket screen
    Get.toNamed('/support-ticket');
  }

  @override
  void onClose() {
    searchController.dispose();
    feedbackController.dispose();
    super.onClose();
  }
}
