import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../themes/styles/colors.dart';
import '../../../themes/styles/typography.dart';

class ProductAppbar extends StatelessWidget {
  const ProductAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) => SliverAppBar(
        expandedHeight: 240,
        floating: false,
        elevation: 0,
        backgroundColor: neutral900,
        pinned: true,
        centerTitle: true,
        flexibleSpace: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            bool isCollapsed = constraints.maxHeight <= kToolbarHeight + 114;
            bool isCollapsedExtended =
                constraints.maxHeight <= kToolbarHeight + 100;
            bool isCollapsedExtendedCollapsed =
                constraints.maxHeight <= kToolbarHeight + 80;
            bool isCollapsedTiny =
                constraints.maxHeight <= kToolbarHeight + 220;

            double appBarSpace1line = 34;
            double appBarSpace2lines = 16;

            String productName = 'este es el nombre del producto';
            double appBarSpace =
                productName.length > 41 ? appBarSpace2lines : appBarSpace1line;
            return FlexibleSpaceBar(
              titlePadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              title: Container(
                width: double.infinity,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    if (!isCollapsed)
                      AnimatedOpacity(
                        opacity: !isCollapsedExtended ? 1 : 0,
                        duration: Duration(milliseconds: 200),
                        child: Column(
                          children: [
                            AnimatedOpacity(
                              opacity: !isCollapsedTiny ? 1 : 0,
                              duration: Duration(milliseconds: 200),
                              child: Text(
                                'viewModel.codeStock',
                                style: TypographyStyle.bodyBlackLarge.copyWith(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            SizedBox(height: appBarSpace),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8),
                              child: CircleAvatar(
                                radius: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                    AnimatedCrossFade(
                      crossFadeState: isCollapsed
                          ? CrossFadeState.showSecond
                          : CrossFadeState.showFirst,
                      duration: Duration(milliseconds: 200),
                      firstChild: Column(
                        children: [
                          Text(
                            ' viewModel.currentStock.name',
                            style: TypographyStyle.bodyBlackLarge,
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            'refPrice.toString()',
                            style: TypographyStyle.bodyBlackLarge.copyWith(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      secondChild: Container(
                        width: double.infinity,
                        margin: EdgeInsets.only(left: 36),
                        child: AnimatedOpacity(
                          opacity: isCollapsedExtendedCollapsed ? 1 : 0,
                          duration: Duration(milliseconds: 200),
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 26,
                              ),
                              SizedBox(width: 8),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'viewModel.codeStock',
                                    style: TypographyStyle.bodyBlackLarge,
                                  ),
                                  Text(
                                    'refPrice.toString()',
                                    style: TypographyStyle.bodyBlackLarge,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      );
}
