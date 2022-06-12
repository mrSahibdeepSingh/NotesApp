import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/note.dart';
import 'notes_list.dart';

class Body extends StatelessWidget {
  Body({Key? key}) : super(key: key);

  Note? note;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Notes',
                  style: Theme.of(context).textTheme.headline1,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  height: 45,
                  width: 55,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.brown,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(
                    Icons.search,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(child: NotesList()),
            const Spacer(),
            Consumer(
              builder: (context, provider, _) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      ' - Notes',
                      style: Theme.of(context).textTheme.headline2,
                    )
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
