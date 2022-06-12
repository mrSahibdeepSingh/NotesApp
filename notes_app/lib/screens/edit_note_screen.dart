import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/models/note.dart';
import 'package:notes_app/provider/note_provider.dart';
import 'package:provider/provider.dart';

import '../widgets/save_button_widget.dart';

class EditNoteScreen extends StatelessWidget {
  EditNoteScreen({
    Key? key,
    required this.note,
  }) : super(key: key);

  final Note note;

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    TextEditingController descController = TextEditingController();

    titleController.text = note.title;
    descController.text = note.description;

    return Scaffold(
      body: Consumer<NoteProvider>(
        builder: (context, provider, child) {
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                      onTap: () {
                        provider.updateNote(note.id!, titleController.text,
                            descController.text, DateTime.now());

                        Navigator.pop(context);
                        Provider.of<NoteProvider>(context, listen: false)
                            .loadNotes();
                      },
                      child: const SaveButtonWidget()),
                  const Divider(),
                  TextField(
                    controller: titleController,
                    decoration: const InputDecoration(
                        hintText: 'Title',
                        border: InputBorder.none,
                        hintStyle: TextStyle(color: Colors.black54)),
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      DateFormat.yMMMd('en_US').format(note.creationTime),
                      style: Theme.of(context).textTheme.headline3,
                    ),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  Expanded(
                    child: TextField(
                      controller: descController,
                      keyboardType: TextInputType.multiline,
                      decoration: const InputDecoration(
                          hintText: 'Write your note...',
                          hintStyle: TextStyle(fontSize: 18),
                          border: InputBorder.none),
                      style: Theme.of(context).textTheme.headline2,
                      maxLines: null,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
