import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:easy_localization/easy_localization.dart';
// import 'package:nota/core/localization/language_provider.dart';
import 'package:nota/core/theme/theme_provider.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    // final languageProvider = Provider.of<LanguageProvider>(context);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_rounded),
          iconSize: 28.sp,
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: Text(
          "settings",
          style: GoogleFonts.patrickHandSc(
            fontSize: 40.sp,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.inversePrimary,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(18.0.r),
          child: Column(
            children: [
              SizedBox(height: 40.h),
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Dark Theme",
                      style: GoogleFonts.patrickHand(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).colorScheme.inversePrimary),
                    ),
                    CupertinoSwitch(
                      thumbColor: Theme.of(context).colorScheme.inversePrimary,
                      inactiveThumbColor:
                          Theme.of(context).colorScheme.inversePrimary,
                      value: Provider.of<ThemeProvider>(context).isDarkMode,
                      onChanged: (value) =>
                          Provider.of<ThemeProvider>(context, listen: false)
                              .toggleTheme(),
                    ),
                  ],
                ),
              ),
              // SizedBox(height: 40.h),
              // Container(
              //   decoration: BoxDecoration(
              //     color: Theme.of(context).colorScheme.primary,
              //     borderRadius: BorderRadius.circular(12.r),
              //   ),
              //   padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       Text(
              //         "language".tr(),
              //         style: GoogleFonts.patrickHand(fontSize: 26.sp),
              //       ),
              //       CupertinoSwitch(
              //         value: languageProvider.currentLanguage == 'ar',
              //         onChanged: (_) =>
              //             languageProvider.toggleLanguage(context),
              //       ),
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
