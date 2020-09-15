import 'package:daiary/beans/HelpSectionBean.dart';
import 'package:daiary/model/HelpModel.dart';
import 'package:flutter/material.dart';

class HelpSection extends StatefulWidget {
  final HelpSectionBean _helpSectionBean;

  HelpSection(this._helpSectionBean);

  @override
  _HelpSectionState createState() => _HelpSectionState();
}

class _HelpSectionState extends State<HelpSection> {
  Widget cards = Center(
    child: CircularProgressIndicator(),
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCards();
  }

  getCards() {
    cards = HelpModel().helpCards(widget._helpSectionBean);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Text(
            widget._helpSectionBean.title,
            style: Theme.of(context).textTheme.headline5,
          ),
        ),
        Text(
          widget._helpSectionBean.description,
          style: Theme.of(context).textTheme.subtitle1,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: cards,
        )
      ],
    );
  }
}
