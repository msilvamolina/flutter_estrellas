import 'package:flutter/material.dart';

class ContentBottomsheet extends StatelessWidget {
  const ContentBottomsheet({required this.children, super.key});

  final List<Widget> children;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 22, right: 22, top: 6, bottom: 0),
      child: Column(children: children),
    );
  }
}
