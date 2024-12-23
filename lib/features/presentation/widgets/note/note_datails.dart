import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nota/features/data/models/note.dart';

class ViewNoteDialog extends StatelessWidget {
  final Note note;
  final VoidCallback onClose;

  const ViewNoteDialog({super.key, required this.note, required this.onClose});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Theme.of(context).colorScheme.background,
      contentPadding: EdgeInsets.all(20.r),
      title: Text(
        "Note Details",
        style: GoogleFonts.patrickHandSc(
          fontSize: 28.sp,
          fontWeight: FontWeight.bold,
          color: Theme.of(context).colorScheme.inversePrimary,
        ),
      ),
      content: SingleChildScrollView(
        child: Text(
          note.text,
          style: GoogleFonts.patrickHand(
            fontSize: 20.sp,
            color: Theme.of(context).colorScheme.inversePrimary,
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: onClose,
          child: Text("Back to Notes",
              style: GoogleFonts.patrickHand(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.inversePrimary,
              )),
        ),
      ],
    );
  }
}
