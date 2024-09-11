import 'package:flutter/material.dart';

class AmzIconButton extends StatelessWidget {
  const AmzIconButton({
    super.key,
    this.onPressed,
    this.badgeCount,
    this.backgroundColor,
    required this.icon,
    required this.tooltip,
  });
  final Function()? onPressed;
  final IconData icon;
  final int? badgeCount;
  final String tooltip;
  final Color? backgroundColor;
  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltip,
      child: Stack(
        children: [
          CircleAvatar(
            backgroundColor: backgroundColor,
            child: IconButton(
              onPressed: onPressed,
              icon: Icon(icon),
            ),
          ),
          if (badgeCount != null && badgeCount! > 0)
            Positioned(
              right: 0,
              child: CircleAvatar(
                radius: 8,
                backgroundColor: Colors.red,
                child: Text(
                  badgeCount.toString(),
                  style: TextStyle(color: Colors.white, fontSize: 8),
                ),
              ),
            )
        ],
      ),
    );
  }
}
