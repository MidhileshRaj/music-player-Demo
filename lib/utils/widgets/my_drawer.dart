import 'package:flutter/material.dart';
import 'package:music_player/view/settings.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          const DrawerHeader(
              child: Center(
                child: Icon(Icons.music_note),
              )),
          ListTile(
            title: const Text('HOME'),
            leading: const Icon(Icons.home),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('SETTINGS'),
            leading: const Icon(Icons.settings),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return const Setting();
                },
              ));
            },
          )
        ],
      ),
    );
  }
}
