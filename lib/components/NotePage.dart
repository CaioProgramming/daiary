import 'package:daiary/beans/NoteBean.dart';
import 'package:daiary/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class NotePage extends StatefulWidget {
  NoteBean note;

  NotePage(this.note);

  @override
  _NotePageState createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  @override
  Widget build(BuildContext context) {
    NoteBean args = widget.note;
    TextEditingController titleController =
        TextEditingController(text: args.noteTitle ?? "");
    TextEditingController textController =
        TextEditingController(text: args.noteText ?? "");

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
