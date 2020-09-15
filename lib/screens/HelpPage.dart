import 'package:daiary/components/HelpCard.dart';
import 'package:daiary/constants.dart';
import 'package:daiary/model/HelpModel.dart';
import 'package:flutter/material.dart';

class HelpPage extends StatefulWidget {
  static String route = '/help';

  @override
  _HelpPageState createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
  @override
  Widget build(BuildContext context) {
    HelpArguments args = ModalRoute.of(context).settings.arguments;

    var helpBean = args.helpBean;
    var title = args.sectionTitle;
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: kDefaultPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BigHelpCard(helpBean, title),
              Text(
                'Recursos',
                style: Theme.of(context).textTheme.headline4.copyWith(
                      color: Theme.of(context).textTheme.bodyText1.color,
                    ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
