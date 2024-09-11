import 'package:flutter/material.dart';

class SidebarRight extends StatelessWidget {
  const SidebarRight({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(onPressed: () {}, icon: Icon(Icons.dangerous)),
      ],
    );
  }
}
