import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_player/controller/theme_provider.dart';
import 'package:provider/provider.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: Container(
        decoration: BoxDecoration(color: Theme.of(context).colorScheme.primary),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Dark Mode',
                style: TextStyle(fontSize: 20),
              ),
              CupertinoSwitch(
                value: Provider.of<ThemeProvider>(context, listen: false)
                    .isDarkMode,
                onChanged: (value) =>
                    Provider.of<ThemeProvider>(context, listen: false)
                        .toggleTheme(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
