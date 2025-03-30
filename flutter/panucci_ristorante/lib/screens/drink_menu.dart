import 'package:flutter/material.dart';
import 'package:panucci_ristorante/cardapio.dart';
import 'package:panucci_ristorante/components/drink_item.dart';
import 'package:panucci_ristorante/components/page_title.dart';
import 'package:panucci_ristorante/models/menu_item.dart';

class DrinkMenu extends StatelessWidget {
  DrinkMenu({Key? key}) : super(key: key);
  final List<MenuItem> items = drinks;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
      child: CustomScrollView(
        slivers: <Widget>[
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(bottom: 16.0),
              child: PageTitle(title: 'Bebidas'),
            ),
          ),
          SliverGrid.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount:
                    MediaQuery.of(context).orientation == Orientation.landscape
                        ? 3
                        : 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                childAspectRatio:
                    MediaQuery.of(context).orientation == Orientation.landscape
                        ? 1.2
                        : 158 / 194,
              ),
              itemCount: items.length,
              itemBuilder: (context, index) {
                return DrinkItem(
                    imageURI: items[index].image,
                    itemTitle: items[index].name,
                    itemPrice: items[index].price);
              })
        ],
      ),
    );
  }
}
