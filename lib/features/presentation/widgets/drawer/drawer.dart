import 'package:flutter/material.dart';
import 'package:nota/features/presentation/widgets/drawer/drawer_tile.dart';
import 'package:nota/features/presentation/pages/settings_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(children: [
        const DrawerHeader(
          child: Icon(Icons.note_rounded),
        ),
        DrawerTile(
          title: "Notes",
          leading: const Icon(Icons.home_rounded),
          onTap: () => Navigator.pop(context),
        ),
        DrawerTile(
            title: "Settings",
            leading: const Icon(Icons.settings_rounded),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SettingsPage()));
            }),
      ]),
    );
  }
}
