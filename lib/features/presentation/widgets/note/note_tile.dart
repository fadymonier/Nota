import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nota/features/presentation/widgets/note/note_datails.dart';
import 'package:nota/features/presentation/widgets/note/note_settings.dart';
import 'package:nota/features/data/models/note.dart';
import 'package:popover/popover.dart';

class NoteTile extends StatelessWidget {
  final Note note;
  final void Function()? onEditPressed;
  final void Function()? onDeletePressed;

  const NoteTile({
    super.key,
    required this.note,
    required this.onEditPressed,
    required this.onDeletePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(8.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        onTap: () => showDialog(
          context: context,
          builder: (context) => ViewNoteDialog(
            note: note,
            onClose: () => Navigator.pop(context),
          ),
        ),
        title: Text(
          note.text,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: GoogleFonts.patrickHand(
            fontSize: 20.sp,
            color: Theme.of(context).colorScheme.inversePrimary,
          ),
        ),
        trailing: Builder(
          builder: (context) => IconButton(
            icon: Icon(
              Icons.more_vert_rounded,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
            onPressed: () => showPopover(
              width: 100.w,
              height: 100.h,
              backgroundColor: Theme.of(context).colorScheme.background,
              context: context,
              bodyBuilder: (context) => NoteSettings(
                onEditTap: () {
                  Navigator.pop(context);
                  onEditPressed?.call();
                },
                onDeleteTap: () {
                  Navigator.pop(context);
                  onDeletePressed?.call();
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
