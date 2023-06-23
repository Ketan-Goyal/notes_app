import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../models/note.dart';
import '../services/api_service.dart';

class ListProvider with ChangeNotifier {
  bool isLoading = true;
  List<Note> notes = [];

  ListProvider() {
    fetchNotes();
  }
  List<Note> getFilteredNotes(String searchQuery) {
    return notes
        .where((element) =>
            element.title!.toLowerCase().contains(searchQuery.toLowerCase()) ||
            element.content!.toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();
  }

  void sortNotes() {
    notes.sort((a, b) => b.dateAdded!.compareTo(a.dateAdded!));
  }

  void addNote(Note note) {
    notes.add(note);
    sortNotes();
    notifyListeners();
    ApiService.addNote(note);
  }

  void editNote(Note note) {
    int indexOfNote =
        notes.indexOf(notes.firstWhere((element) => element.id == note.id));
    notes[indexOfNote] = note;
    sortNotes();
    notifyListeners();
    ApiService.addNote(note);
  }

  void deleteNote(Note note) {
    int indexOfNote =
        notes.indexOf(notes.firstWhere((element) => element.id == note.id));
    notes.removeAt(indexOfNote);
    notifyListeners();
    ApiService.deleteNote(note);
  }

  void fetchNotes() async {
    User? user = FirebaseAuth.instance.currentUser;
    notes = await ApiService.fetchNotes(user!.uid);
    isLoading = false;
    sortNotes();
    notifyListeners();
  }
}
