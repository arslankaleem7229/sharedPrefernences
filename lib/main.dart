import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:path_provider/path_provider.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _savedData = "";
  @override
  void initState() {
    super.initState();
    _loadSavedData();
  }

  _loadSavedData() async {
    SharedPreferences _preferences = await SharedPreferences.getInstance();
    setState(() {
      if (_preferences.getString("data") != null &&
          _preferences.getString("data").isNotEmpty) {
        setState(() {
          _savedData = _preferences.getString("data");
        });
      } else {
        setState(() {
          _savedData = "Empty";
        });
      }
    });
  }

  _saveMessage(String message) async {
    SharedPreferences _preferences = await SharedPreferences.getInstance();
    _preferences.setString("data", message);
  }

  TextEditingController _textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
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
                mainAxisSize: MainAxisSize.min,
                children: [
                  new Text("Save Data"),
                  new Padding(padding: EdgeInsets.all(15.0)),
                  new Text(_savedData),
                ],
              ),
              onPressed: () {
                _saveMessage(_textEditingController.text);
                setState(() {
                  _loadSavedData();
                });
              },
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _textEditingController.dispose();
  }
}
