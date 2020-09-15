import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:tinycolor/tinycolor.dart';

class SuggestionCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: TinyColor(Theme.of(context).scaffoldBackgroundColor)
              .darken()
              .color,
          borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Text(
                        'Sugestão de exercício',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                    Text(
                      'Fazer um exercício ajudará a te aliviar e respirar um pouco, deixe que a natureza te liberte',
                      style: Theme.of(context).textTheme.caption,
                    )
                  ],
                ),
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(AntDesign.right),
              color: Theme.of(context).accentColor,
            )
          ],
        ),
      ),
    );
  }
}
