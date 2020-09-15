import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daiary/beans/HelpBean.dart';
import 'package:daiary/beans/HelpSectionBean.dart';
import 'package:daiary/components/HelpSection.dart';
import 'package:daiary/model/BaseData.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/async.dart';
import 'package:flutter/src/widgets/frameworkath/path.dart';

class HelpModel extends BaseData {
  @override
  CollectionReference collectionReference() {
    // TODO: implement collectionReference
    throw UnimplementedError();
  }

  @override
  StreamBuilder<QuerySnapshot> defaultBuilder(Stream<dynamic> stream,
      {Widget emptyResult}) {
    return StreamBuilder<QuerySnapshot>(
      stream: stream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final helpSectionsDocuments = snapshot.data.documents;
          if (helpSectionsDocuments.isNotEmpty) {
            return ListView.builder(itemBuilder: (context, position) {
              HelpSectionBean sectionBean = HelpSectionBean.fromMap(
                  getSnapshotMap(helpSectionsDocuments, position),
                  helpSectionsDocuments[position].documentID);
              return HelpSection(sectionBean);
            });
          }
        }
        return emptyResult;
      },
    );
  }
}

class HelpArguments {
  HelpBean helpBean;
  String sectionTitle;

  HelpArguments(this.helpBean, this.sectionTitle);
}
