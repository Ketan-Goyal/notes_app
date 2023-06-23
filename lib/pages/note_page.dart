import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/models/userModel.dart';
import 'package:notes_app/providers/Listprovider.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

import '../models/note.dart';

class AddNewPage extends StatefulWidget {
  final bool isUpdate;
  final Note? note;
  const AddNewPage({
    super.key,
    required this.isUpdate,
    this.note,
  });

  @override
  State<AddNewPage> createState() => _AddNewPageState();
}

class _AddNewPageState extends State<AddNewPage> {
  User? user;
  TextEditingController titleTEC = TextEditingController();
  TextEditingController contentTEC = TextEditingController();

  FocusNode noteFocus = FocusNode();

  void addNewNote() async {
    Note newNote = Note(
      id: const Uuid().v1(),
      userid: user!.uid,
      title: titleTEC.text,
      content: contentTEC.text,
      dateAdded: DateTime.now(),
    );
    Provider.of<ListProvider>(context, listen: false).addNote(newNote);
    Navigator.pop(context);
  }

  void updateNote() {
    widget.note!.title = titleTEC.text;
    widget.note!.content = contentTEC.text;
    widget.note!.dateAdded = DateTime.now();
    Provider.of<ListProvider>(context, listen: false).editNote(widget.note!);
    Navigator.pop(context);
  }

  @override
  void initState() {
    user = FirebaseAuth.instance.currentUser;
    if (widget.isUpdate) {
      titleTEC.text = widget.note!.title!;
      contentTEC.text = widget.note!.content!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Theme.of(context).primaryColor,
        actions: [
          IconButton(
            onPressed: () {
              if (widget.isUpdate) {
                updateNote();
              } else {
                addNewNote();
              }
            },
            icon: const Icon(Icons.check),
          )
        ],
        title: const Text("New Note"),
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Column(
            children: [
              TextField(
                controller: titleTEC,
                autofocus: widget.isUpdate ? false : true,
                onSubmitted: (val) {
                  if (val != "") {
                    noteFocus.requestFocus();
                  }
                },
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
                decoration: const InputDecoration(
                  hintText: "Title",
                  border: InputBorder.none,
                ),
              ),
              Expanded(
                child: TextField(
                  controller: contentTEC,
                  focusNode: noteFocus,
                  maxLines: null,
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                  decoration: const InputDecoration(
                    hintText: "Body",
                    border: InputBorder.none,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
