import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daiary/beans/NoteBean.dart';
import 'package:daiary/components/NotePage.dart';
import 'package:daiary/model/BaseData.dart';
import 'package:daiary/presenter/NotePresenter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/async.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class DiaryModel extends BaseData {
  @override
  CollectionReference collectionReference() =>
      firestoreInstance.collection("diary");

  @override
  StreamBuilder<QuerySnapshot> defaultStreamBuilder({Stream<dynamic> stream}) {
    return StreamBuilder<QuerySnapshot>(
      stream: stream ?? defaultStream(),
      builder: defaultBuilder,
    );
  }

  @override
  Widget defaultBuilder(context, snapshot) {
    if (snapshot.hasData) {
      final diaryDocuments = snapshot.data.documents;
      List<NoteBean> notes = List();
      notes.add(NoteBean());
      if (diaryDocuments.isNotEmpty) {
        for (var diarySnaphot in diaryDocuments) {
          notes.add(
              NoteBean.fromMap(diarySnaphot.data, diarySnaphot.documentID));
        }
      }
      return notesPageView(notes, context);
    }
    return SizedBox();
  }

  PageView notesPageView(List<NoteBean> diaries, BuildContext context) {
    NotePresenter presenter =
        Provider.of<NotePresenter>(context, listen: false);

    if (presenter.currentNote == null) {
      presenter.updateNote(diaries[0]);
    }
    return PageView.builder(
      itemBuilder: (context, index) {
        return NotePage(diaries[index]);
      },
      itemCount: diaries.length,
      onPageChanged: (index) {
        NotePresenter presenter =
            Provider.of<NotePresenter>(context, listen: false);
        presenter.updateNote(diaries[index]);
      },
    );
  }

  Future<String> addNote(NoteBean noteBean) async {
    if (noteBean.id == null) {
      DocumentReference newNote =
          await collectionReference().add(noteBean.toMap());
      if (newNote != null) {
        return 'Diário salvo com sucesso';
      } else {
        return 'Ocorreu um erro ao salvar seu diário';
      }
    } else {
      updateNote(noteBean);
    }
  }

  Future<String> updateNote(NoteBean noteBean) async {
    try {
      await collectionReference()
          .document(noteBean.id)
          .updateData(noteBean.toMap());
      return 'Diário atualizado com sucesso';
    } catch (e) {
      print(e);
      return 'Ocorreu um erro ao salvar seu diário';
    }
  }
}
