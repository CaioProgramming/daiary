import 'package:daiary/components/SuggestionCard.dart';
import 'package:daiary/model/HelpModel.dart';
import 'package:flutter/material.dart';

import '../utils.dart';

class TodayPage extends StatefulWidget {
  @override
  _TodayPageState createState() => _TodayPageState();
}

class _TodayPageState extends State<TodayPage> {
  Widget sections = CircularProgressIndicator();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getSections();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Utils.currentDayofWeek()),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [SuggestionCard(), sections],
          ),
        ),
      ),
    );
  }

  void getSections() {
    HelpModel helpModel = HelpModel();
    sections = helpModel.defaultStreamBuilder();
    setState(() {});
  }
}
