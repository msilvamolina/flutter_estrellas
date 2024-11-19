import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../components/buttons/buttons.dart';
import '../../../themes/styles/colors.dart';
import '../../../themes/styles/typography.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({
    super.key,
    this.imageUrl,
    required this.title,
    required this.message,
    required this.isProductoInCatalog,
    required this.addFunction,
    required this.removeFunction,
  });
  final String? imageUrl;
  final String title;
  final String message;
  final bool isProductoInCatalog;
  final Function()? addFunction;
  final Function()? removeFunction;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool isLoading = false;

  void _setLoading(bool value) {
    if (mounted) {
      setState(() {
        isLoading = value;
      });
    }
  }

  Future<void> _handleAddFunction() async {
    if (widget.addFunction != null) {
      _setLoading(true);
      try {
        widget.addFunction!();
      } finally {
        _setLoading(false);
      }
    }
  }

  Future<void> _handleRemoveFunction() async {
    if (widget.removeFunction != null) {
      _setLoading(true);
      try {
        widget.removeFunction!();
      } finally {
        _setLoading(false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 0, bottom: 24, left: 16, right: 0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: widget.imageUrl != ''
                ? Image.network(
                    widget.imageUrl!,
                    width: 54,
                    height: 54,
                    fit: BoxFit.cover,
                  )
                : Image.asset(
                    'assets/images/catalog_empty.png',
                    width: 54,
                    height: 54,
                  ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: TypographyStyle.bodyBlackLarge,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  widget.message,
                  style: TypographyStyle.bodyRegularMedium
                      .copyWith(color: neutral700),
                ),
              ],
            ),
          ),
          if (!isLoading)
            widget.isProductoInCatalog
                ? Button(
                    style: ButtonStyles.secondaryCirlce,
                    child: SvgPicture.asset(
                      'assets/svg/catalog.svg',
                      width: 16,
                    ),
                    onPressed: _handleRemoveFunction,
                  )
                : Button(
                    style: ButtonStyles.secondaryCirlce,
                    child: SvgPicture.asset(
                      'assets/svg/PlusCircle.svg',
                      width: 26,
                      color: secondaryBase,
                    ),
                    onPressed: _handleAddFunction,
                  )
          else
            const Padding(
              padding: EdgeInsets.only(right: 16),
              child: SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(secondaryBase),
                  strokeWidth: 2.0,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
