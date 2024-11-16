import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';

import '../tabs_views/description_view.dart';
import 'product_sticky_header.dart';

class ProductStickyContent extends StatelessWidget {
  const ProductStickyContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => SliverStickyHeader(
        header: ProductStickyHeader(),
        sliver: MediaQuery.removePadding(
          context: context,
          removeBottom: true,
          removeTop: true,
          removeLeft: true,
          removeRight: true,
          child: SliverFillRemaining(
            child: TabBarView(
              children: [
                DescriptionView(), // Contenido de la pestaña "Inicio"
                Center(child: Text('Detalles')),
                Center(child: Text('Garantía')),
              ],
            ),
          ),
        ),
      );
}
