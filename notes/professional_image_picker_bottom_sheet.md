# Professional Image Picker Bottom Sheet Update

## 🎯 Task Completed
Updated the image picker bottom sheet in the Support Ticket screen to have a more professional design with camera and gallery options displayed in a row layout matching the app's design system.

## 🎨 Design Improvements

### Before:
- ❌ Basic vertical list layout with ListTiles
- ❌ Simple icons without styling
- ❌ Basic white background
- ❌ No visual hierarchy or branding

### After:
- ✅ **Professional Bottom Sheet Design**
- ✅ **Row Layout**: Camera and Gallery side by side
- ✅ **Consistent Branding**: Purple accent color (#7B7DFF)
- ✅ **Visual Hierarchy**: Clear title, subtitle, and descriptions
- ✅ **Professional Styling**: Cards with shadows and proper spacing

## 🔧 Key Features Implemented

### 1. **Professional Header**
```dart
// Drag handle indicator
Container(
  width: 40, height: 4,
  decoration: BoxDecoration(
    color: Color(0xFFE0E0E0),
    borderRadius: BorderRadius.circular(2),
  ),
)

// Clear title and subtitle
Text('Select Image Source', fontSize: 20, fontWeight: w600)
Text('Choose how you want to add your screenshot', color: #7F7F7F)
```

### 2. **Row Layout for Options**
```dart
Row(
  children: [
    Expanded(child: _buildImageSourceOption(...)), // Camera
    SizedBox(width: 16),
    Expanded(child: _buildImageSourceOption(...)), // Gallery
  ],
)
```

### 3. **Styled Option Cards**
```dart
Container(
  padding: EdgeInsets.all(20),
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(16),
    border: Border.all(color: #7B7DFF with 20% opacity),
    boxShadow: [BoxShadow with purple tint],
  ),
  child: Column([
    // 60x60 icon container with purple background
    // Title and subtitle text
  ]),
)
```

### 4. **Enhanced Visual Elements**
- **Drag Handle**: Visual indicator for swipe-to-dismiss
- **Semi-transparent Backdrop**: Dark overlay behind bottom sheet
- **Card Shadows**: Subtle shadows for depth
- **Purple Accent Color**: Consistent with app branding
- **Proper Spacing**: 24dp padding, 16dp gaps
- **Icon Containers**: 60x60 purple-tinted backgrounds

### 5. **Professional Cancel Button**
```dart
TextButton(
  backgroundColor: Color(0xFFF5F5F5),
  shape: RoundedRectangleBorder(borderRadius: 12),
  child: Text('Cancel', color: #7F7F7F),
)
```

## 📱 User Experience

### Camera Option:
- **Icon**: Camera icon in purple-tinted container
- **Title**: "Camera"
- **Subtitle**: "Take a photo"
- **Action**: Opens camera for instant photo capture

### Gallery Option:
- **Icon**: Photo library icon in purple-tinted container  
- **Title**: "Gallery"
- **Subtitle**: "Choose from library"
- **Action**: Opens photo gallery for selection

### Interactive Features:
- **Drag Handle**: Users can swipe down to dismiss
- **Tap Outside**: Dismisses bottom sheet
- **Visual Feedback**: Cards have subtle shadows and borders
- **Consistent Theming**: Matches app's purple color scheme

## 🎯 Design System Compliance
- **Colors**: Uses app's primary purple (#7B7DFF)
- **Typography**: Consistent font weights and sizes
- **Spacing**: Follows app's spacing constants
- **Border Radius**: Consistent 16dp radius for cards
- **Shadows**: Subtle depth with proper opacity
- **Layout**: Professional grid-based positioning

The bottom sheet now provides a premium user experience that matches the professional quality of the rest of the app! 🎉
