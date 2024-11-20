import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ButtonCircleSvg extends StatelessWidget {
  const ButtonCircleSvg({
    required this.assetName,
    required this.width,
    this.onTap,
    this.color,
    super.key,
  });

  final Function()? onTap;
  final String assetName;
  final double width;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            child: SvgPicture.asset(
              assetName,
              width: width,
              colorFilter: color != null
                  ? ColorFilter.mode(
                      color!,
                      BlendMode.srcIn,
                    )
                  : null,
            ),
          ),
        ),
      ),
    );
  }
}
