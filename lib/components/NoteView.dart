import 'package:daiary/model/DiaryModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NoteView extends StatefulWidget {
  @override
  _NoteViewState createState() => _NoteViewState();
}

class _NoteViewState extends State<NoteView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: diaries,
          ),
        ],
      ),
    );
  }

  Widget diaries = CupertinoActivityIndicator();

  getNotes() {
    var diaryModel = DiaryModel();
    diaries = diaryModel.defaultStreamBuilder();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getNotes();
  }
}
