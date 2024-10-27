import 'package:flutter/widgets.dart';
import 'package:flutter_estrellas/app/themes/styles/colors.dart';

import '../../../themes/styles/typography.dart';

class ProductMainHeader extends StatelessWidget {
  const ProductMainHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) => SliverToBoxAdapter(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        '\$ 0 (+0,0%)',
                        style: TypographyStyle.bodyBlackLarge
                            .copyWith(color: warning500),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
