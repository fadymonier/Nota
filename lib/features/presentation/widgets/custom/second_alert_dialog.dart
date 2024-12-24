import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nota/features/data/models/note.dart';
import 'package:nota/features/data/models/note_database.dart';
import 'package:provider/provider.dart';

class MySecondAlertDialog extends StatelessWidget {
  final TextEditingController noteController;
  final Note note;
  const MySecondAlertDialog(
      {super.key, required this.noteController, required this.note});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Theme.of(context).colorScheme.background,
      title: Text(
        "Update Note",
        style: GoogleFonts.patrickHandSc(
          fontSize: 28.sp,
          fontWeight: FontWeight.bold,
          color: Theme.of(context).colorScheme.inversePrimary,
        ),
      ),
      content: TextField(
          controller: noteController,
          style: GoogleFonts.patrickHand(
            fontSize: 20.sp,
            color: Theme.of(context).colorScheme.inversePrimary,
          )),
      actions: [
        TextButton(
          onPressed: () {
            context
                .read<NoteDatabase>()
                .updateNote(note.id, noteController.text);
            noteController.clear();
            Navigator.pop(context);
          },
          child: Text("Update ",
              style: GoogleFonts.patrickHand(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: Theme.of(context).colorScheme.inversePrimary,
              )),
        ),
      ],
    );
  }
}
