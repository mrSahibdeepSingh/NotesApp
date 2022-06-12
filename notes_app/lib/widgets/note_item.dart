import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class NoteItem extends StatelessWidget {
  const NoteItem(
    this.title,
    this.description,
    this.creationTime, {
    Key? key,
  }) : super(key: key);

  final String title;
  final String description;
  final DateTime creationTime;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          elevation: 4,
          child: ListTile(
            leading: const Icon(Icons.list),
            title: Text(
              title,
              style: Theme.of(context).textTheme.headline2,
            ),
            subtitle: Text(
              DateFormat.yMMMd('en_US').format(creationTime),
              style: Theme.of(context).textTheme.headline3,
            ),
          ),
        ),
        // const Divider(
        //   color: Colors.grey,
        //   thickness: 0.6,
        //   indent: 20,
        // ),
      ],
    );
  }
}
