import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
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
  // text controller
  final noteController = TextEditingController();

  @override
  void initState() {
    super.initState();
    readNotes();
  }

  //create a note
  void createNote() {
    showDialog(
        context: context,
        builder: (builder) => AlertDialog(
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
                    'New Note',
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

  //read notes
  void readNotes() {
    context.read<NoteDatabase>().fetchNotes();
  }

  //update notes
  void updateNote(Note note) {
    noteController.text = note.text;
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              backgroundColor: Theme.of(context).colorScheme.background,
              title: const Text("Update Note"),
              content: TextField(
                controller: noteController,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    context
                        .read<NoteDatabase>()
                        .updateNote(note.id, noteController.text);
                    noteController.clear();
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Update",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                  ),
                ),
              ],
            ));
  }

  //delete a note
  void deleteNoteWithConfirmation(Note note) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              backgroundColor: Theme.of(context).colorScheme.background,
              title: const Text("Delete Note"),
              content: const Text("Are you sure you want to delete this note?"),
              actions: [
                TextButton(
                  onPressed: () {
                    context.read<NoteDatabase>().deleteNote(note.id);
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Delete",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Cancel",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                  ),
                ),
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    // note database
    final noteDatabase = context.watch<NoteDatabase>();

    // current notes
    List<Note> currentNotes = noteDatabase.currentNotes;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.note_add_rounded),
            iconSize: 28.sp,
            color: Theme.of(context).colorScheme.inversePrimary,
            onPressed: createNote,
          ),
        ],
        centerTitle: true,
        title: Text(
          "Nota",
          style: GoogleFonts.patrickHandSc(
              fontSize: 40.sp,
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
