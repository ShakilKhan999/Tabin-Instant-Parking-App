# FAQ Accordion Behavior Update

## 🎯 Task Completed
Updated the Help & Support FAQ section to implement proper accordion behavior where only one FAQ can be open at a time, and fixed the arrow icons to show proper up/down animations.

## 🔄 Changes Made

### 1. **Controller Updates** (`help_support_controller.dart`)
- **Replaced** `RxMap<int, bool> faqExpansionStates` with `RxInt expandedFaqIndex`
- **Modified** `toggleFaqExpansion()` method to implement accordion behavior:
  - If clicking on already expanded FAQ → close it (set to -1)
  - If clicking on different FAQ → close current and open new one
- **Updated** `isFaqExpanded()` to check if index matches current expanded index

### 2. **UI Updates** (`faq_tab_widget.dart`)
- **Replaced** SVG arrow icons with Material Design `Icons.keyboard_arrow_down`
- **Fixed** arrow rotation: `turns: isExpanded ? 0.5 : 0.0` (180-degree rotation)
- **Added** smooth `AnimatedCrossFade` for expand/collapse content animation
- **Removed** unused imports for SVG files

## 🎨 User Experience Improvements

### Before:
- ❌ Multiple FAQs could be open simultaneously
- ❌ Arrow icons not showing/rotating properly
- ❌ Basic expand/collapse without smooth animations

### After:
- ✅ **Accordion Behavior**: Only one FAQ can be open at a time
- ✅ **Proper Arrow Animation**: Down arrow rotates to up when expanded
- ✅ **Smooth Animations**: Content fades in/out with AnimatedCrossFade
- ✅ **Visual Feedback**: Border color changes when expanded

## 🔧 Technical Implementation

### Accordion Logic:
```dart
void toggleFaqExpansion(int index) {
  if (expandedFaqIndex.value == index) {
    expandedFaqIndex.value = -1; // Close current
  } else {
    expandedFaqIndex.value = index; // Open new, close others
  }
}
```

### Arrow Animation:
```dart
AnimatedRotation(
  turns: isExpanded ? 0.5 : 0.0, // 180-degree rotation
  duration: const Duration(milliseconds: 300),
  child: Icon(Icons.keyboard_arrow_down),
)
```

### Content Animation:
```dart
AnimatedCrossFade(
  firstChild: const SizedBox.shrink(),
  secondChild: Column(...), // FAQ answer content
  crossFadeState: isExpanded ? CrossFadeState.showSecond : CrossFadeState.showFirst,
  duration: const Duration(milliseconds: 300),
)
```

## 🎯 Result
The FAQ section now behaves like a professional accordion component where users can focus on one question at a time, with smooth animations and proper visual feedback.
