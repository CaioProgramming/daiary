import 'package:daiary/beans/NoteBean.dart';
import 'package:flutter/cupertino.dart';

class NotePresenter extends ChangeNotifier {
  NoteBean currentNote;
  var noteController = PageController(initialPage: 0);

  updateNote(NoteBean noteBean) {
    currentNote = noteBean;
    notifyListeners();
  }

  updatePage(int position) {
    noteController.jumpToPage(position);
  }
}
