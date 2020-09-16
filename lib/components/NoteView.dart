import 'package:daiary/model/DiaryModel.dart';
import 'package:daiary/presenter/NotePresenter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:provider/provider.dart';

import '../utils.dart';

class NoteView extends StatefulWidget {
  @override
  _NoteViewState createState() => _NoteViewState();
}

class _NoteViewState extends State<NoteView> {
  @override
  Widget build(BuildContext context) {
    String getCurrentNoteDate() {
      NotePresenter notePresenter = Provider.of(context, listen: false);

      if (notePresenter.currentNote == null) return "Diários";
      return Utils.currentDayOfMonth(
          dateTime: Provider.of<NotePresenter>(context, listen: false)
              .currentNote
              .date);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(getCurrentNoteDate()),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
              icon: Icon(
                Feather.folder,
                color: Theme.of(context).textTheme.headline6.color,
              ),
              onPressed: () {}),
          IconButton(
            icon: Icon(
              Feather.bookmark,
              color: Theme.of(context).textTheme.headline6.color,
            ),
            onPressed: () {},
          )
        ],
      ),
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
