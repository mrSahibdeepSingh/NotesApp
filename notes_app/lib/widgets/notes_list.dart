import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:notes_app/provider/note_provider.dart';
import 'package:notes_app/services/NoteDbHelper.dart';
import 'package:provider/provider.dart';

import '../screens/edit_note_screen.dart';
import 'note_item.dart';

class NotesList extends StatelessWidget {
  NotesList({
    Key? key,
  }) : super(key: key);

  var container = Container(
    alignment: Alignment.centerRight,
    padding: const EdgeInsets.only(right: 30),
    color: Colors.red,
    child: const Icon(
      Icons.delete,
      color: Colors.white,
      size: 30,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Provider.of<NoteProvider>(context, listen: false).loadNotes(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Consumer<NoteProvider>(
            builder: (context, provider, _) {
              return buildNotes(provider, context, container);
            },
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}

Widget buildNotes(
        NoteProvider provider, BuildContext context, Container container) =>
    ListView.builder(
      shrinkWrap: true,
      itemCount: provider.items.length,
      itemBuilder: (context, index) {
        return Dismissible(
          key: UniqueKey(),
          direction: DismissDirection.endToStart,
          onDismissed: (direction) {
            provider.deleteNote(provider.items[index].id!);
            Provider.of<NoteProvider>(context, listen: false).loadNotes();
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text(
                  'Note deleted',
                  style: TextStyle(color: Colors.white),
                ),
                backgroundColor: Colors.red,
              ),
            );
          },
          background: container,
          child: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          EditNoteScreen(note: provider.items[index])));
            },
            child: NoteItem(
                provider.items[index].title,
                provider.items[index].description,
                provider.items[index].creationTime),
          ),
        );
      },
    );
