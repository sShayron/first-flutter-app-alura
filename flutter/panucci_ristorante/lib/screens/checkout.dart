import 'package:flutter/material.dart';
import 'package:panucci_ristorante/cardapio.dart';
import 'package:panucci_ristorante/components/main_drawer.dart';
import 'package:panucci_ristorante/components/order_item.dart';
import 'package:panucci_ristorante/components/payment_method.dart';
import 'package:panucci_ristorante/components/payment_total.dart';
import 'package:panucci_ristorante/components/section_title.dart';
import 'package:panucci_ristorante/models/menu_item.dart';

class Checkout extends StatelessWidget {
  const Checkout({Key? key}) : super(key: key);

  @override
  @override
  Widget build(BuildContext context) {
    final List<MenuItem> items = pedido;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Ristorante Panucci"),
        backgroundColor: Theme.of(context).colorScheme.surfaceVariant,
        actions: const <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Icon(
              Icons.account_circle,
              size: 32,
            ),
          )
        ],
        centerTitle: true,
      ),
      drawer: const MainDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: CustomScrollView(
          slivers: <Widget>[
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(bottom: 8),
                child: SectionTitle(title: 'Pedido'),
              ),
            ),
            SliverList.builder(
              itemBuilder: (context, index) {
                return OrderItem(
                    imageURI: items[index].image,
                    itemTitle: items[index].name,
                    itemPrice: items[index].price);
              },
              itemCount: items.length,
            ),
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(bottom: 8),
                child: SectionTitle(title: 'Pagamento'),
              ),
            ),
            const SliverToBoxAdapter(child: PaymentMethod()),
            const SliverToBoxAdapter(
              child: SectionTitle(title: 'Confirmar'),
            ),
            SliverToBoxAdapter(child: PaymentTotal())
          ],
        ),
      ),
    );
  }
}
