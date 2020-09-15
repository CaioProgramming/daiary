import 'package:daiary/beans/NoteBean.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_icons/flutter_icons.dart';

import '../utils.dart';

class NoteCard extends StatelessWidget {
  final NoteBean note;
  final bool writeNote;

  NoteCard(this.note, {this.writeNote = false});

  @override
  Widget build(BuildContext context) {
    if (writeNote) return writeNoteCard(context);
    return CupertinoButton(
      padding: EdgeInsets.all(4),
      child: Container(
        width: 200,
        height: 300,
        decoration: BoxDecoration(
            color: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
            gradient: LinearGradient(colors: [
              Theme.of(context).primaryColor,
              Theme.of(context).primaryColorDark,
              Theme.of(context).accentColor
            ], begin: Alignment.topLeft, end: Alignment.bottomRight),
            borderRadius: BorderRadius.horizontal(
                left: Radius.circular(5), right: Radius.circular(15))),
        child: Stack(
          children: [
            Positioned(
              left: 10,
              child: Container(
                width: 10,
                height: 300,
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                  Theme.of(context).hintColor.withOpacity(0.75),
                  Theme.of(context).hintColor,
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
              ),
            ),
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    note.noteTitle,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 24),
                  ),
                  Text(
                    Utils.currentDayOfMonth(),
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1
                        .copyWith(color: Colors.white.withOpacity(0.90)),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget writeNoteCard(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.all(4),
      child: Container(
        width: 200,
        height: 300,
        decoration: BoxDecoration(
            color: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
            gradient: LinearGradient(
                colors: [Colors.grey, Colors.white],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
            borderRadius: BorderRadius.horizontal(
                left: Radius.circular(10), right: Radius.circular(15))),
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Feather.feather,
                    color: Colors.white,
                  ),
                  Text(
                    'Escrever nova anotação',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
