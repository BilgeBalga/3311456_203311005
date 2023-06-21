import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../db/databaseHelper.dart';

void main() {
  runApp(NotePage());
}

class NotePage extends StatefulWidget {
  @override
  _NotePageState createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  late TextEditingController _noteTitleController;
  late TextEditingController _noteController;
  List<Map<String, dynamic>> _data = [];

  @override
  void initState() {
    super.initState();
    _noteTitleController = TextEditingController();
    _noteController = TextEditingController();
    _refreshData();
  }

  Future<void> _refreshData() async {
    final List<Map<String, dynamic>> data =
        await DatabaseHelper.instance.getAllNotes();
    setState(() {
      _data = data;
    });
  }

  Future<void> _insertData() async {
    final String noteTitle = _noteTitleController.text;
    final String note = _noteController.text;
    if (noteTitle.isNotEmpty && note.isNotEmpty) {
      await DatabaseHelper.instance.insertNote(
        title: noteTitle,
        body: note,
      );
      _noteTitleController.clear();
      _noteController.clear();
      await _refreshData();
    }
  }

  Future<void> _deleteData(int id) async {
    await DatabaseHelper.instance.deleteNote(id);
    await _refreshData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes'),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.add,
              color: Colors.cyan,
              size: 28,
            ),
            onPressed: () {
              _insertData();
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: _noteTitleController,
              decoration: const InputDecoration(
                hintText: 'Note Title',
              ),
            ),
          ),
          const SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 10),
            child: TextField(
              controller: _noteController,
              decoration: const InputDecoration(
                hintText: 'Note',
              ),
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              itemCount: _data.length,
              itemBuilder: (context, index) {
                final item = _data[index];
                return Card(
                  child: ListTile(
                    title: Text(
                      item['title'],
                      style: const TextStyle(
                          fontWeight: FontWeight.w600, color: Colors.black),
                    ),
                    subtitle: Text(item['body']),
                    trailing: IconButton(
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                      onPressed: () => _deleteData(item['id']),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _noteTitleController.dispose();
    _noteController.dispose();
    super.dispose();
  }
}
