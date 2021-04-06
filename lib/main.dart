import 'package:flutter/material.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SharedPreferences(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class SharedPreferences extends StatefulWidget {
  @override
  _SharedPreferencesState createState() => _SharedPreferencesState();
}

class _SharedPreferencesState extends State<SharedPreferences> {
  TextEditingController _textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shared Preferences"),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
      ),
      body: Container(
        padding: EdgeInsets.all(13.4),
        alignment: Alignment.topCenter,
        child: ListTile(
          title: TextField(
            controller: _textEditingController,
            decoration: InputDecoration(labelText: "Write something"),
          ),
          subtitle: TextButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.redAccent),
            ),
            child: Column(
              children: [
                Text("Save Data"),
                Padding(
                  padding: EdgeInsets.all(15.0),
                ),
              ],
            ),
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}

// Future<String> get _localpath async {
//   final directory = await getApplicationDocumentsDirectory();
//   return directory.path;
// }

// Future<File> get _localfile async {
//   final path = await _localpath;
//   return new File("$path/data.txt");
// }

// Future<File> writeData(String message) async {
//   final file = await _localfile;
//   return file.writeAsString("$message");
// }

// Future<String> readData() async {
//   try {
//     final file = await _localfile;
//     final String data = await file.readAsString();
//     return data;
//   } on Exception catch (e) {
//     print("$e: File not found or failed to fetch data!");
//     return null;
//   }
// }
