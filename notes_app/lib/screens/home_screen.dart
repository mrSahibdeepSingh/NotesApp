import 'package:flutter/material.dart';
import 'package:notes_app/widgets/home_body_widget.dart';

import 'add_item_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen(
    this.title, {
    Key? key,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.edit_note,
          size: 30,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddNewNote()));
        },
      ),
    );
  }
}
