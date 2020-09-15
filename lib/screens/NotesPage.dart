import 'package:daiary/beans/NoteBean.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

import '../components/NotePage.dart';

class NotesPage extends StatefulWidget {
  static String route = '/Notes';
  @override
  _NotesPageState createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  var noteController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: PageView(
            controller: PageController(),
            children: [
              NotePage(NoteBean(
                  noteTitle: 'Coragem',
                  noteText:
                      'Encontrar coragem durante o caos do mundo real, vem sendo impossível',
                  marked: true)),
              NotePage(NoteBean(
                  noteTitle: 'Ânimo',
                  noteText:
                      'Cada dia que passa sinto q não tem mais o pq estar aqui, parece q estou assistindo o fim do mundo na arquibancada, esperando o momento sem expressão alguma.',
                  marked: false)),
              NotePage(NoteBean(
                  noteTitle: 'Laços',
                  noteText:
                      'Não sei se sou eu quem desistiu de todos ou todos que não viram oq porque mantê-los algum laço comigo.',
                  marked: true)),
              NotePage(NoteBean(
                  noteTitle: 'Consciência',
                  noteText:
                      'Já não sei nem que eu sou mais, nem o que eu realmente estou fazendo por aqui, parece que perdi a mim mesmo.',
                  marked: false)),
            ],
          ),
        ),
        Container(
          color: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                  icon: Icon(
                    Feather.arrow_left,
                    color: Theme.of(context)
                        .bottomNavigationBarTheme
                        .unselectedItemColor,
                  ),
                  onPressed: () => noteController.previousPage(
                      duration: Duration(seconds: 1), curve: Curves.bounceOut)),
              SizedBox(),
              SizedBox(),
              IconButton(
                  icon: Icon(
                    Feather.arrow_right,
                    color: Theme.of(context)
                        .bottomNavigationBarTheme
                        .selectedItemColor,
                  ),
                  onPressed: () => noteController.nextPage(
                      duration: Duration(seconds: 1), curve: Curves.easeIn))
            ],
          ),
        )
      ],
    );
  }
}
