import 'package:flutter/material.dart';
import 'package:panucci_ristorante/cardapio.dart';
import 'package:panucci_ristorante/components/highlight_item.dart';
import 'package:panucci_ristorante/components/page_title.dart';
import 'package:panucci_ristorante/models/menu_item.dart';

class Highlights extends StatelessWidget {
  Highlights({Key? key}) : super(key: key);
  final List<MenuItem> items = destaques;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
      child: CustomScrollView(
        slivers: <Widget>[
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(bottom: 16.0),
              child: PageTitle(title: 'Destaques'),
            ),
          ),
          MediaQuery.of(context).orientation == Orientation.landscape
              ? const LandscapeList()
              : const PortraitList()
        ],
      ),
    );
  }
}

class PortraitList extends StatelessWidget {
  const PortraitList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<MenuItem> items = destaques;
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return HighlightItem(
            imageURI: items[index].image,
            itemTitle: items[index].name,
            itemPrice: items[index].price,
            itemDescription: items[index].description ?? "",
          );
        },
        childCount: items.length,
      ),
    );
  }
}

class LandscapeList extends StatelessWidget {
  const LandscapeList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<MenuItem> items = destaques;

    return SliverGrid.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 1),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return HighlightItem(
            imageURI: items[index].image,
            itemTitle: items[index].name,
            itemPrice: items[index].price,
            itemDescription: items[index].description ?? "",
          );
        });
  }
}
