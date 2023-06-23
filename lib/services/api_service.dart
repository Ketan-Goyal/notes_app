import 'dart:convert';

import '../models/note.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static String baseURL = "https://notes-app-ketan.cyclic.app/notes";

  static Future<void> addNote(Note note) async {
    Uri requestUri = Uri.parse("$baseURL/add");
    var response = await http.post(requestUri, body: note.toMap());
    var decoded = jsonDecode(response.body);
    print(decoded.toString());
  }

  static Future<void> deleteNote(Note note) async {
    Uri requestUri = Uri.parse("$baseURL/delete");
    var response = await http.post(requestUri, body: note.toMap());
    var decoded = jsonDecode(response.body);
    print(decoded.toString());
  }

  static Future<List<Note>> fetchNotes(String userid) async {
    Uri requestUri = Uri.parse("$baseURL/list");
    var response = await http.post(requestUri, body: {"userid": userid});
    var decoded = jsonDecode(response.body);

    List<Note> notes = [];
    for (var noteMap in decoded) {
      notes.add(Note.fromMap(noteMap));
    }

    return notes;
  }
}
