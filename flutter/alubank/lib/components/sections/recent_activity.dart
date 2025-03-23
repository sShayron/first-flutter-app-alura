import 'package:alubank/components/box_card.dart';
import 'package:alubank/components/color_dot.dart';
import 'package:alubank/components/content_division.dart';
import 'package:alubank/themes/theme_colors.dart';
import 'package:flutter/material.dart';

class RecentActivity extends StatelessWidget {
  const RecentActivity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16),
      child: BoxCard(boxContent: _RecentActivityContent()),
    );
  }
}

class _RecentActivityContent extends StatelessWidget {
  const _RecentActivityContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _CardValue(
                title: 'Saida',
                value: '\$9900.97',
                dotColor: ThemeColors.recentActivity['spent']!),
            _CardValue(
                title: 'Entrada',
                value: '\$9332.35',
                dotColor: ThemeColors.recentActivity['income']!)
          ],
        ),
        const Padding(
          padding: EdgeInsets.only(top: 16.0, bottom: 8.0),
          child: Text('Limite de gastos \$432.90'),
        ),
        Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(5.0)),
          child: const LinearProgressIndicator(
            value: 0.3,
            minHeight: 8.0,
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
          child: ContentDivision(),
        ),
        const Text(
            'Esse mês você gastou \$1500.00 com jogos. Tente abaixar esse custo!'),
        TextButton(
            onPressed: () {},
            child:
                const Text('Diga-me como!', style: TextStyle(fontSize: 16.0)))
      ],
    );
  }
}

class _CardValue extends StatelessWidget {
  final String title;
  final String value;
  final Color dotColor;

  const _CardValue({
    Key? key,
    required this.title,
    required this.value,
    required this.dotColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 4.0),
          child: ColorDot(color: dotColor),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title),
            Text(value, style: Theme.of(context).textTheme.bodyLarge)
          ],
        )
      ],
    );
  }
}
