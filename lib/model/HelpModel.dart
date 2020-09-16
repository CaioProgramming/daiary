import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daiary/beans/HelpBean.dart';
import 'package:daiary/beans/HelpSectionBean.dart';
import 'package:daiary/components/HelpCard.dart';
import 'package:daiary/components/HelpSection.dart';
import 'package:daiary/constants.dart';
import 'package:daiary/model/BaseData.dart';
import 'package:flutter/cupertino.dart';

class HelpModel extends BaseData {
  @override
  CollectionReference collectionReference() =>
      firestoreInstance.collection('sections');

  StreamBuilder<QuerySnapshot> helpCards(HelpSectionBean helpSectionBean) {
    Stream sectionStream = collectionReference()
        .document(helpSectionBean.id)
        .collection('helpers')
        .snapshots();
    return StreamBuilder(
        stream: sectionStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final documents = snapshot.data.documents;
            if (documents.isNotEmpty) {
              return GridView.builder(
                  gridDelegate: kDefaultGridDelegate,
                  itemCount: documents.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    HelpBean helpBean = HelpBean.fromMap(
                        getSnapshotMap(documents, index),
                        documents[index].documentID);
                    return HelpCard(helpBean, helpSectionBean.title);
                  });
            } else {
              return SizedBox();
            }
          } else {
            return SizedBox();
          }
        });
  }

  @override
  StreamBuilder<QuerySnapshot> defaultStreamBuilder({Stream<dynamic> stream}) {
    return StreamBuilder<QuerySnapshot>(
        builder: defaultBuilder, stream: stream ?? defaultStream());
  }

  @override
  Widget defaultBuilder(BuildContext context, snapshot) {
    if (snapshot.hasData) {
      final helpSectionsDocuments = snapshot.data.documents;
      if (helpSectionsDocuments.isNotEmpty) {
        return ListView.builder(
            shrinkWrap: true,
            itemCount: helpSectionsDocuments.length,
            itemBuilder: (context, position) {
              HelpSectionBean sectionBean = HelpSectionBean.fromMap(
                  getSnapshotMap(helpSectionsDocuments, position),
                  helpSectionsDocuments[position].documentID);
              return HelpSection(sectionBean);
            });
      }
    }
    return Text('Não encontramos nenhum recurso de ajuda :(');
  }
}

class HelpArguments {
  HelpBean helpBean;
  String sectionTitle;
  HelpArguments(this.helpBean, this.sectionTitle);
}
