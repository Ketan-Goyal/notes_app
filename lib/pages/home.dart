import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/pages/note_page.dart';
import 'package:provider/provider.dart';

import '../models/note.dart';
import '../providers/Listprovider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String searchQuery = "";
  @override
  Widget build(BuildContext context) {
    ListProvider notesProvider = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Notes App'),
        centerTitle: true,
        foregroundColor: Theme.of(context).primaryColor,
      ),
      body: (notesProvider.isLoading == false)
          ? ListView(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 10, left: 10, right: 10),
                  child: TextField(
                    onChanged: (val) {
                      setState(() {
                        searchQuery = val;
                      });
                    },
                    autofocus: false,
                    decoration: InputDecoration(
                      hintText: "Search Here",
                      hintStyle: TextStyle(fontSize: 20),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SafeArea(
                  child: (notesProvider.getFilteredNotes(searchQuery).length >
                          0)
                      ? GridView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                          ),
                          itemCount: notesProvider
                              .getFilteredNotes(searchQuery)
                              .length,
                          itemBuilder: (context, index) {
                            Note currentNote = notesProvider
                                .getFilteredNotes(searchQuery)[index];
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                      builder: (context) => AddNewPage(
                                        isUpdate: true,
                                        note: currentNote,
                                      ),
                                    ));
                              },
                              onLongPress: () {
                                notesProvider.deleteNote(currentNote);
                              },
                              child: Container(
                                margin: const EdgeInsets.all(5),
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        color: Theme.of(context).primaryColor,
                                        blurRadius: 5,
                                        // offset: Offset(),
                                        blurStyle: BlurStyle.outer)
                                  ],
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)),
                                  // border: Border.all(color: Colors.grey),
                                ),
                                // color: Theme.of(context).primaryColor,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      currentNote.title!,
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(
                                      height: 7,
                                    ),
                                    Text(
                                      currentNote.content!,
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.grey[700],
                                      ),
                                      maxLines: 6,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          })
                      : const Center(
                          child: Text("No note Found"),
                        ),
                ),
              ],
            )
          : Center(child: CircularProgressIndicator()),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
              context,
              CupertinoPageRoute(
                fullscreenDialog: true,
                builder: (context) => const AddNewPage(
                  isUpdate: false,
                ),
              ));
        },
      ),
    );
  }
}
