import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/models/note.dart';
import 'package:notes_app/provider/note_provider.dart';
import 'package:provider/provider.dart';

import '../widgets/bottom_appBar.dart';
import '../widgets/save_button_widget.dart';
// import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';

class AddNewNote extends StatelessWidget {
  AddNewNote({Key? key, this.note}) : super(key: key);

  final Note? note;
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () async {
                  Provider.of<NoteProvider>(context, listen: false)
                      .addNewNote(titleController.text, descController.text);
                  Navigator.pop(context);
                  Provider.of<NoteProvider>(context, listen: false).loadNotes();
                },
                child: const SaveButtonWidget(),
              ),
              const Divider(
                color: Colors.grey,
              ),
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
                  DateFormat.yMMMd('en_US').format(DateTime.now()),
                  style: Theme.of(context).textTheme.headline3,
                ),
              ),
              TextField(
                controller: descController,
                keyboardType: TextInputType.multiline,
                decoration: const InputDecoration(
                    hintText: 'Write your note...',
                    hintStyle: TextStyle(fontSize: 18),
                    border: InputBorder.none),
                style: Theme.of(context).textTheme.headline2,
                maxLines: null,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BtmAppBar(),
    );
  }
}
