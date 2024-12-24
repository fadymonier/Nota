import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nota/features/data/models/note_database.dart';
import 'package:provider/provider.dart';

class MyFirstAlertDialog extends StatelessWidget {
  final TextEditingController noteController;
  const MyFirstAlertDialog({super.key, required this.noteController});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Theme.of(context).colorScheme.background,
      content: Padding(
        padding: EdgeInsets.all(10.0.r),
        child: TextField(
          controller: noteController,
          decoration: InputDecoration.collapsed(
            hintText: 'add your Note here...',
            hintStyle: GoogleFonts.patrickHand(
              fontSize: 20.sp,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),
          style: TextStyle(
            color: Theme.of(context).colorScheme.inversePrimary,
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            context.read<NoteDatabase>().addNote(noteController.text);
            noteController.clear();
            Navigator.pop(context);
          },
          child: Text(
            'add New Note',
            style: GoogleFonts.patrickHand(
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),
        ),
      ],
    );
  }
}
