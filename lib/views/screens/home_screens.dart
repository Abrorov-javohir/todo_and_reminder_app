
import 'package:flutter/material.dart';
import 'package:todo_and_reminder_app/views/widgets/custom_drawer.dart';

class Homescreen extends StatelessWidget {
  final ValueChanged<bool> onThemeModeChanged;
  Homescreen({super.key, required this.onThemeModeChanged});

  bool isPasswordCorrect = true;
  int a = 1234;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HomeScreen"),
      ),
      drawer: CustomDrawer(onThemeModeChanged: onThemeModeChanged),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                errorText: isPasswordCorrect ? null : "Try again to enter",
                suffix: TextButton(
                  onPressed: () {
                    if (a == 1234) {
                      isPasswordCorrect = true;
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Homescreen(
                            onThemeModeChanged: onThemeModeChanged,
                          ),
                        ),
                      );
                    } else {
                      isPasswordCorrect = false;
                    }
                  },
                  child: Text("Enter"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
