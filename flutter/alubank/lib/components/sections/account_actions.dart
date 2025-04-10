import 'package:alubank/components/box_card.dart';
import 'package:alubank/components/section_title.dart';
import 'package:flutter/material.dart';

class AccountActions extends StatelessWidget {
  const AccountActions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: const EdgeInsets.all(16),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: EdgeInsets.only(bottom: 16.0),
          child: SectionTitle(
            title: 'Ações da conta',
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          spacing: 12.0,
          children: [
            _AccountActionsContent(
              icon: Icon(Icons.account_balance_wallet),
              text: 'Depositar',
            ),
            _AccountActionsContent(
              icon: Icon(Icons.cached),
              text: 'Transferir',
            ),
            _AccountActionsContent(
              icon: Icon(Icons.center_focus_strong),
              text: 'Ler',
            )
          ],
        )
      ]),
    );
  }
}

class _AccountActionsContent extends StatelessWidget {
  final Icon icon;
  final String text;
  const _AccountActionsContent(
      {Key? key, required this.icon, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () {},
        child: BoxCard(
          boxContent: SizedBox(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: icon,
                ),
                Text(
                  text,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
