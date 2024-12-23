import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class NoteSettings extends StatelessWidget {
  final void Function()? onEditTap;
  final void Function()? onDeleteTap;

  const NoteSettings(
      {super.key, required this.onEditTap, required this.onDeleteTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onEditTap,
          child: Container(
            height: 50.h,
            color: Theme.of(context).colorScheme.background,
            child: Center(
              child: Text(
                "Edit",
                style: GoogleFonts.patrickHand(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: onDeleteTap,
          child: Container(
            height: 50.h,
            color: Theme.of(context).colorScheme.background,
            child: Center(
              child: Text(
                "Delete",
                style: GoogleFonts.patrickHand(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
