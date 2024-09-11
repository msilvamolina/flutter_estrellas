import 'package:flutter/material.dart';

class UserView extends StatelessWidget {
  const UserView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Card(
            child: Container(
              padding: const EdgeInsets.all(16.0),
              width: double.infinity,
              child: Text(
                'Four page',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
          ),
        ),
        Expanded(
          child: Card(
            child: Container(
              padding: const EdgeInsets.all(16.0),
              width: double.infinity,
              child: Text(
                'Four page',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
          ),
        ),
        Expanded(
          child: Card(
            child: Container(
              padding: const EdgeInsets.all(16.0),
              width: double.infinity,
              child: Text(
                'Four page',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
          ),
        ),
        Expanded(
          child: Card(
            child: Container(
              padding: const EdgeInsets.all(16.0),
              width: double.infinity,
              child: Text(
                'Four page',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
