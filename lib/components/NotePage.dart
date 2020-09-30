import 'dart:async';

import 'package:daiary/beans/NoteBean.dart';
import 'package:daiary/model/DiaryModel.dart';
import 'package:daiary/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class NotePage extends StatefulWidget {
  final NoteBean noteBean;

  NotePage(this.noteBean);

  @override
  _NotePageState createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  TextEditingController titleController;
  TextEditingController textController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    titleController = TextEditingController(text: widget.noteBean.title ?? "");
    textController = TextEditingController(text: widget.noteBean.text ?? "");
  }

  @override
  Widget build(BuildContext context) {
    Timer titleTimer, textTimer;

    void updateTitle(String newTitle) async {
      if (titleTimer != null) return;
      titleTimer = Timer(Duration(seconds: 10), () async {
        widget.noteBean.title = titleController.text;
        String result = await DiaryModel().addNote(widget.noteBean);
        final snackbar = SnackBar(content: Text(result));
        Scaffold.of(context).showSnackBar(snackbar);
        titleTimer = null;
      });
    }

    void markNote() {
      NoteBean note = widget.noteBean;
      note.marked = !note.marked;
      DiaryModel().updateNote(note);
    }

    void updateText(String newText) async {
      if (textTimer != null) return;
      textTimer = Timer(Duration(seconds: 10), () async {
        widget.noteBean.text = textController.text;
        String result = await DiaryModel().addNote(widget.noteBean);
        final snackbar = SnackBar(content: Text(result));
        Scaffold.of(context).showSnackBar(snackbar);
        textTimer = null;
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            Text(Utils.currentDayOfMonth(dateTime: widget.noteBean.date)),
            widget.noteBean.id != null
                ? Text(
                    'Última edição em ${Utils.currentTime(dateTime: widget.noteBean.lastUpdate)}',
                    style: Theme.of(context).textTheme.caption,
                  )
                : SizedBox()
          ],
        ),
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
              widget.noteBean.marked
                  ? FlutterIcons.bookmark_faw5s
                  : FlutterIcons.bookmark_faw5,
              color: Theme.of(context).textTheme.headline6.color,
            ),
            onPressed: () => markNote(),
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
                          maxLines: 400,
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
