import 'package:flutter/material.dart';
import 'package:panucci_ristorante/cardapio.dart';
import 'package:panucci_ristorante/components/food_item.dart';
import 'package:panucci_ristorante/components/page_title.dart';
import 'package:panucci_ristorante/models/menu_item.dart';

class FoodMenu extends StatelessWidget {
  FoodMenu({Key? key}) : super(key: key);
  final List<MenuItem> items = comidas;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
      child: CustomScrollView(
        slivers: <Widget>[
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(bottom: 16.0),
              child: PageTitle(title: 'Menu'),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return FoodItem(
                  imageURI: items[index].image,
                  itemTitle: items[index].name,
                  itemPrice: items[index].price,
                );
              },
              childCount: items.length,
            ),
          )
        ],
      ),
    );
  }
}
