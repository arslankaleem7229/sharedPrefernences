import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  runApp(MyApp());
  var data = await readData();
  if (data != null) {
    String message = await readData();
    print(message);
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ReadWriteFiles(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ReadWriteFiles extends StatefulWidget {
  @override
  _ReadWriteFilesState createState() => _ReadWriteFilesState();
}

class _ReadWriteFilesState extends State<ReadWriteFiles> {
  TextEditingController _textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Read & write from file"),
        centerTitle: true,
        backgroundColor: Colors.tealAccent,
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: ListTile(
          title: TextField(
            controller: _textEditingController,
            decoration: InputDecoration(labelText: "Input Text"),
          ),
          subtitle: TextButton(
            child: Column(
              children: [
                Text("Add"),
                Text("$_localpath"),
              ],
            ),
            onPressed: () async {
              final path = await _localpath;
              print(path);
              writeData(_textEditingController.text);
            },
          ),
        ),
      ),
    );
  }
}

Future<String> get _localpath async {
  final directory = await getApplicationDocumentsDirectory();
  return directory.path;
}

Future<File> get _localfile async {
  final path = await _localpath;
  return new File("$path/data.txt");
}

Future<File> writeData(String message) async {
  final file = await _localfile;
  return file.writeAsString("$message");
}

Future<String> readData() async {
  try {
    final file = await _localfile;
    final String data = await file.readAsString();
    return data;
  } on Exception catch (e) {
    print("$e: File not found or failed to fetch data!");
    return null;
  }
}
