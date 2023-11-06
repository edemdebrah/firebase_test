import 'package:flutter/material.dart';

import '../services/firestore.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //creating firestore object

  final FirestoreService firestoreService = FirestoreService();
  //text editing controller
  TextEditingController textController = TextEditingController();
  //open a dialog box
  void openNoteBox() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: TextField(
          controller: textController,
        ),
        actions: [
          //button
          ElevatedButton(
            onPressed: () {
              firestoreService.addNote(textController.text);
              //clear the texfield
              textController.clear();

              //close the dialog box
              Navigator.pop(context);
            },
            child: Text('ADD'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[200],
      floatingActionButton: FloatingActionButton(
        onPressed: openNoteBox,
        child: Icon(Icons.add),
      ),
    );
  }
}
