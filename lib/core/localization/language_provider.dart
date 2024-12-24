// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:nota/core/cache/cache_helper.dart';

// class LanguageProvider with ChangeNotifier {
//   String _currentLanguage = 'en';

//   LanguageProvider() {
//     _loadSavedLanguage();
//   }

//   String get currentLanguage => _currentLanguage;

//   void _loadSavedLanguage() {
//     _currentLanguage = CacheHelper.getSavedLanguage();
//   }

//   Future<void> toggleLanguage(BuildContext context) async {
//     if (_currentLanguage == 'en') {
//       _currentLanguage = 'ar';
//       await CacheHelper.saveLanguage('ar');
//     } else {
//       _currentLanguage = 'en';
//       await CacheHelper.saveLanguage('en');
//     }

//     await context.setLocale(Locale(_currentLanguage));

//     notifyListeners();
//   }
// }
