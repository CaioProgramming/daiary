import 'package:daiary/components/NoteView.dart';
import 'package:daiary/presenter/NotePresenter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NotesPage extends StatefulWidget {
  static String route = '/Notes';
  @override
  _NotesPageState createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NotePresenter(),
      child: NoteView(),
    );
  }
}
