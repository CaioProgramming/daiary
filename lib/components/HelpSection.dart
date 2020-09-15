import 'package:daiary/beans/HelpBean.dart';
import 'package:daiary/beans/HelpSectionBean.dart';
import 'package:daiary/components/HelpCard.dart';
import 'package:flutter/material.dart';

class HelpSection extends StatelessWidget {
  final HelpSectionBean _helpSectionBean;

  HelpSection(this._helpSectionBean);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Text(
            _helpSectionBean.title,
            style: Theme.of(context).textTheme.headline5,
          ),
        ),
        Text(
          _helpSectionBean.description,
          style: Theme.of(context).textTheme.subtitle1,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: GridView.count(
            shrinkWrap: true,
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 4,
            children: [
              HelpCard(
                  HelpBean(
                      title: "Conexões",
                      description:
                          "São mais importante do que se imagina, são nossa ponte para o mundo.",
                      background:
                          "https://64.media.tumblr.com/9929ee1c0362d5df70a989b124f587d5/5f06f60b6aa5353d-8a/s500x750/065d94c3576d16b34f1d566189dd147bf70a4ac0.gifv"),
                  _helpSectionBean.title),
              HelpCard(
                  HelpBean(
                      title: "Amizade",
                      description: "Heróis que nunca imaginamos.",
                      background:
                          "https://64.media.tumblr.com/8f9929b165e707f89f2d0976070f4f65/5c8c4ccc6e0bd64f-8d/s500x750/4d2eebdc282a1c7d4a75db2d342bcf32f0fdda6f.jpg"),
                  _helpSectionBean.title),
              HelpCard(
                  HelpBean(
                      title: "Tentações",
                      description: "Quando começa o vicio?",
                      background:
                          "https://64.media.tumblr.com/f5009973c7a280614c8db655b9ee123c/299f85ff1beb2509-5a/s500x750/54edeaac3b7a1e98115334db575f3e3ebb763b8e.gifv"),
                  _helpSectionBean.title),
              HelpCard(
                  HelpBean(
                      title: "Erros",
                      description: "Não se deixe afogar por eles.",
                      background:
                          "https://64.media.tumblr.com/8c57c75aeb053b93b7b42d693e685b93/tumblr_pzokoi9qbb1wo2a1ao1_500.gifv"),
                  _helpSectionBean.title),
            ],
          ),
        )
      ],
    );
  }
}
