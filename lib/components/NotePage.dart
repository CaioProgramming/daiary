import 'dart:async';

import 'package:daiary/beans/NoteBean.dart';
import 'package:daiary/model/DiaryModel.dart';
import 'package:daiary/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class NotePage extends StatelessWidget {
  final NoteBean noteBean;

  NotePage(this.noteBean);

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController =
        TextEditingController(text: noteBean.title ?? "");
    TextEditingController textController =
        TextEditingController(text: noteBean.text ?? "");
    Timer titleTimer, textTimer;

    void updateTitle(String newTitle) async {
      if (newTitle != titleController.text) {
        titleTimer = null;
        titleTimer = Timer(Duration(seconds: 10), () async {
          noteBean.title = newTitle;
          String result = await DiaryModel().updateNote(noteBean);
          final snackbar = SnackBar(content: Text(result));
          Scaffold.of(context).showSnackBar(snackbar);
        });
      } else {
        noteBean.title = newTitle;
        String result = await DiaryModel().addNote(noteBean);
        final snackbar = SnackBar(content: Text(result));
        Scaffold.of(context).showSnackBar(snackbar);
      }
    }

    void updateText(String newText) async {
      if (newText != titleController.text) {
        titleTimer = null;
        titleTimer = Timer(Duration(seconds: 10), () async {
          noteBean.text = newText;
          String result = await DiaryModel().addNote(noteBean);
          final snackbar = SnackBar(content: Text(result));
          Scaffold.of(context).showSnackBar(snackbar);
        });
      } else {
        noteBean.text = newText;
        String result = await DiaryModel().updateNote(noteBean);
        final snackbar = SnackBar(content: Text(result));
        Scaffold.of(context).showSnackBar(snackbar);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(Utils.currentDayOfMonth()),
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
            child: PageView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: TextField(
                            maxLines: 1,
                            controller: titleController,
                            onChanged: updateTitle,
                            style: Theme.of(context).textTheme.headline5,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none),
                                hintText:
                                    'Defina esse dia\nem poucas palavras'),
                          ),
                        ),
                        TextField(
                          keyboardType: TextInputType.multiline,
                          controller: textController,
                          onChanged: updateText,
                          maxLines: null,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none),
                              hintText:
                                  'Diga o que quiser sobre seu dia aqui. Uma palavra, uma lembrança, tudo será salvo.'),
                        ),
                      ],
                      crossAxisAlignment: CrossAxisAlignment.start,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
