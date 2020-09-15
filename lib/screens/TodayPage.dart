import 'package:daiary/beans/HelpSectionBean.dart';
import 'package:daiary/components/HelpSection.dart';
import 'package:daiary/components/SuggestionCard.dart';
import 'package:flutter/material.dart';

import '../utils.dart';

class TodayPage extends StatelessWidget {
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
            children: [
              SuggestionCard(),
              HelpSection(HelpSectionBean(
                  title: 'Saúde e prosperidade',
                  description:
                      'Crie objetivos e construa um futuro brilhante')),
              HelpSection(HelpSectionBean(
                  title: 'Ame a si mesmo',
                  description:
                      'Com o amor próprio tudo estará em seu alcance')),
            ],
          ),
        ),
      ),
    );
  }
}
