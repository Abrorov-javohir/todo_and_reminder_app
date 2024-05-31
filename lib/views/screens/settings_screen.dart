
import 'package:flutter/material.dart';
import 'package:todo_and_reminder_app/utils/app_constants.dart';
import 'package:todo_and_reminder_app/views/screens/home_screens.dart';
import 'package:todo_and_reminder_app/views/widgets/custom_drawer.dart';

class SettingsScreen extends StatelessWidget {
  final ValueChanged<bool> onThemeModeChanged;
  const SettingsScreen({super.key, required this.onThemeModeChanged});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      drawer: CustomDrawer(
        onThemeModeChanged: onThemeModeChanged,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            SwitchListTile(
              value: AppConstants.themeMode == ThemeMode.dark,
              onChanged: (value) {
                onThemeModeChanged(value);
              },
              title: const Text("Night mode"),
            ),
            ListTile(
              title: const Text(
                "Install Pin Code",
                style: TextStyle(color: Colors.black),
              ),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text("Install Pin Code"),
                      content: const Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextField(
                            keyboardType: TextInputType.numberWithOptions(),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Enter PIN',
                            ),
                          ),
                        ],
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Homescreen(
                                      onThemeModeChanged: onThemeModeChanged)),
                            );
                          },
                          child: const Text('Install'),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
