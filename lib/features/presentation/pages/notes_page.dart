import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:nota/features/presentation/widgets/custom/my_first_alert_dialog.dart';
import 'package:nota/features/presentation/widgets/custom/second_alert_dialog.dart';
import 'package:nota/features/presentation/widgets/drawer/drawer.dart';
import 'package:nota/features/presentation/widgets/note/note_tile.dart';
import 'package:nota/features/data/models/note.dart';
import 'package:nota/features/data/models/note_database.dart';
import 'package:provider/provider.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  final noteController = TextEditingController();

  @override
  void initState() {
    super.initState();
    readNotes();
  }

  void createNote() {
    showDialog(
        context: context,
        builder: (builder) =>
            MyFirstAlertDialog(noteController: noteController));
  }

  void readNotes() {
    context.read<NoteDatabase>().fetchNotes();
  }

  void updateNote(Note note) {
    noteController.text = note.text;
    showDialog(
        context: context,
        builder: (context) =>
            MySecondAlertDialog(noteController: noteController, note: note));
  }

  void deleteNoteWithConfirmation(Note note) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              backgroundColor: Theme.of(context).colorScheme.background,
              title: Text(
                "Delete Note",
                style: GoogleFonts.patrickHand(
                  fontSize: 28.sp,
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
              content: Text(
                "are you sure you want to Delete this Note!",
                style: GoogleFonts.patrickHand(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    context.read<NoteDatabase>().deleteNote(note.id);
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Delete",
                    style: GoogleFonts.patrickHand(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).colorScheme.error,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Cancel",
                    style: GoogleFonts.patrickHand(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                  ),
                ),
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    final noteDatabase = context.watch<NoteDatabase>();
    List<Note> currentNotes = noteDatabase.currentNotes;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 8.0.r),
            child: IconButton(
              icon: const Icon(Icons.note_add_rounded),
              iconSize: 28.sp,
              color: Theme.of(context).colorScheme.inversePrimary,
              onPressed: createNote,
            ),
          ),
        ],
        centerTitle: true,
        title: Text(
          "nota".tr(),
          style: GoogleFonts.patrickHandSc(
              fontSize: 42.sp,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.inversePrimary),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      drawer: const MyDrawer(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 25.0.r, top: 10.r),
            child: Text(
              "my notes",
              style: GoogleFonts.patrickHandSc(
                  fontSize: 34.sp,
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).colorScheme.inversePrimary),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: currentNotes.length,
              itemBuilder: (context, index) {
                final note = currentNotes[index];
                return Padding(
                  padding:
                      EdgeInsets.only(top: 10.0.r, left: 25.0.r, right: 25.0.r),
                  child: NoteTile(
                    note: note,
                    onEditPressed: () => updateNote(note),
                    onDeletePressed: () => deleteNoteWithConfirmation(note),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
