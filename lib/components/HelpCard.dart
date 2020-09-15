import 'package:daiary/beans/HelpBean.dart';
import 'package:daiary/model/HelpModel.dart';
import 'package:daiary/screens/HelpPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tinycolor/tinycolor.dart';

class HelpCard extends StatelessWidget {
  final HelpBean _helpBean;
  final String _sectionTitle;

  HelpCard(this._helpBean, this._sectionTitle);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: CupertinoButton(
            padding: EdgeInsets.all(0),
            onPressed: () => Navigator.pushNamed(context, HelpPage.route,
                arguments: HelpArguments(_helpBean, _sectionTitle)),
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(_helpBean.background))),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Text(
            _helpBean.title,
            style: TextStyle(fontSize: 16),
          ),
        )
      ],
    );
  }

  goToHelpPage(HelpBean helpBean, BuildContext context) {
    Navigator.pushNamed(context, HelpPage.route, arguments: helpBean);
  }
}

class BigHelpCard extends StatelessWidget {
  final HelpBean _helpBean;
  final String _sectionTitle;

  BigHelpCard(this._helpBean, this._sectionTitle);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
              image: NetworkImage(_helpBean.background), fit: BoxFit.cover)),
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.all(16),
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: TinyColor(Theme.of(context).scaffoldBackgroundColor)
                      .lighten()
                      .color,
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Text(
                      _helpBean.title,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                  Text(
                    _helpBean.description,
                    textAlign: TextAlign.center,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: MaterialButton(
                      minWidth: double.maxFinite,
                      padding: EdgeInsets.symmetric(vertical: 16),
                      onPressed: () async {},
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      color: Theme.of(context).scaffoldBackgroundColor,
                      child: Text('Começar',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).accentColor)),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
