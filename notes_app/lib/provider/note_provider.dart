import 'package:flutter/cupertino.dart';
import 'package:notes_app/models/note.dart';
import 'package:notes_app/services/NoteDbHelper.dart';

class NoteProvider extends ChangeNotifier {
  late final Note note;
  List<Note> _items = [];

  loadNotes() async {
    _items = await NoteDBHelper.instance.readAllNotes();

    notifyListeners();
  }

  List<Note> get items => [..._items];

  addNewNote(String title, String description) async {
    final note = Note(
        title: title, description: description, creationTime: DateTime.now());

    await NoteDBHelper.instance.create(note);

    notifyListeners();
  }

  updateNote(int id, String title, String description, DateTime updateTime) {
    final note = Note(
        id: id,
        title: title,
        description: description,
        creationTime: updateTime);
    NoteDBHelper.instance.updateNote(note);
    notifyListeners();
  }

  deleteNote(int id) {
    NoteDBHelper.instance.deleteNote(id);

    notifyListeners();
  }
}
