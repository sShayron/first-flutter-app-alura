import 'package:alubank/components/box_card.dart';
import 'package:alubank/components/color_dot.dart';
import 'package:alubank/components/content_division.dart';
import 'package:alubank/components/section_title.dart';
import 'package:alubank/themes/my_theme.dart';
import 'package:alubank/themes/theme_colors.dart';
import 'package:flutter/material.dart';

class AccountPoints extends StatelessWidget {
  const AccountPoints({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Padding(
          padding: EdgeInsets.only(bottom: 16.0),
          child: SectionTitle(title: 'Pontos da conta'),
        ),
        BoxCard(
          boxContent: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 8.0),
                child: Text('Pontos totais:'),
              ),
              Text(
                '3000',
                style: myTheme.textTheme.bodyLarge,
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 8.0, top: 8.0),
                child: ContentDivision(),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text('Objetivos:',
                    style: Theme.of(context).textTheme.titleMedium),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child:
                          ColorDot(color: ThemeColors.goals['free_delivery']),
                    ),
                    const Text('Entrega gratis: 15000pts')
                  ],
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: ColorDot(color: ThemeColors.goals['streaming']),
                  ),
                  const Text('1 mes de streaming: 30000pts')
                ],
              ),
            ],
          ),
        )
      ]),
    );
  }
}
