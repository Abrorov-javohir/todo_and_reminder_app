import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_and_reminder_app/models/task.dart';

class ContactEditDialog extends StatefulWidget {
  final Contact contact;
  const ContactEditDialog({super.key, required this.contact});

  @override
  State<ContactEditDialog> createState() => _ContactEditDialogState();
}

class _ContactEditDialogState extends State<ContactEditDialog> {
  final _formKey = GlobalKey<FormState>();

  String name = "";
  String task = "";

  @override
  void initState() {
    super.initState();

    name = widget.contact.name;
    task = widget.contact.task;
  }

  void add() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      Navigator.pop(context, {
        "name": name,
        "task": task,
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Add Contact"),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              initialValue: name,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Task name",
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "Please enter name";
                }

                return null;
              },
              onSaved: (newValue) {
                if (newValue != null) {
                  name = newValue;
                }
              },
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              initialValue: task,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Task",
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "Please enter task";
                }

                return null;
              },
              onSaved: (newValue) {
                if (newValue != null) {
                  task = newValue;
                }
              },
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text("Cancel"),
        ),
        ElevatedButton(
          onPressed: add,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
          ),
          child: const Text("Edit"),
        ),
      ],
    );
  }
}
