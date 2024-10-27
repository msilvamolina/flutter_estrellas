import 'package:flutter/material.dart';

import '../../../themes/styles/colors.dart';

class ProductStickyHeader extends StatelessWidget {
  const ProductStickyHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => PreferredSize(
        preferredSize: TabBar(
          tabs: <Widget>[],
        ).preferredSize,
        child: Container(
          decoration: BoxDecoration(
            color: neutral900,
            border: Border(
              bottom: BorderSide(
                color: neutral800,
                width: 2,
              ),
            ),
          ),
          child: TabBar(
            // onTap: viewModel.stockTabViewed,
            indicatorColor: primaryBase,
            tabs: <Tab>[
              Tab(
                child: Text(
                  'content.myPosition',
                ),
              ),
              Tab(
                child: Text(
                  'content.information',
                ),
              ),
              Tab(
                child: Text(
                  'content.technical',
                ),
              ),
            ],
          ),
        ),
      );
}
