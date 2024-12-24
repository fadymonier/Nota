import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class DrawerTile extends StatelessWidget {
  final String title;
  final Widget leading;
  final void Function() onTap;
  const DrawerTile(
      {super.key,
      required this.title,
      required this.leading,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 25.0.r),
      child: ListTile(
        title: Text(
          title,
          style: GoogleFonts.patrickHandSc(
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
              color: Theme.of(context).colorScheme.inversePrimary),
        ),
        leading: leading,
        iconColor: Theme.of(context).colorScheme.inversePrimary,
        onTap: onTap,
      ),
    );
  }
}
